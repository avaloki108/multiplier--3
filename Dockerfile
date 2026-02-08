# syntax=docker/dockerfile:1.4
ARG IMAGE=ubuntu:22.04
ARG PLATFORM=linux/amd64
FROM --platform=${PLATFORM} ${IMAGE} AS builder
ENV INSTALL_DIR=/work/install

ARG NODE_VERSION=20
ARG PYTHON_VERSION=3.11

# Install dependencies
RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -yq \
        --no-install-recommends \
        software-properties-common \
        pkg-config \
        curl \
        wget \
        unzip \
        git \
        python${PYTHON_VERSION} \
        python${PYTHON_VERSION}-dev \
        python3-pip \
        build-essential && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

SHELL [ "/bin/bash", "-o", "pipefail", "-c" ]

# Install Node.js and npm
RUN curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm@latest

# Install Foundry
RUN curl -L https://foundry.paradigm.xyz | bash && \
    bash -c "source ~/.bashrc && foundryup"

ENV PATH="/root/.foundry/bin:${PATH}"

# Install Solidity compiler and analysis tools
RUN add-apt-repository ppa:ethereum/ethereum && \
    apt-get update && \
    apt-get install -y solc && \
    pip3 install slither-analyzer solc-select mythril

WORKDIR /work

# Install Hardhat and other Node.js tools
RUN npm install -g hardhat @nomicfoundation/hardhat-toolbox

# Configure and build multiplier for Solidity
RUN --mount=type=bind,source=.,target=/work/src/multiplier \
    --mount=type=tmpfs,target=/work/build \
    mkdir -p ${INSTALL_DIR}/bin && \
    if [ -d /work/src/multiplier/bin ]; then \
        cp -r /work/src/multiplier/bin/* ${INSTALL_DIR}/bin/ 2>/dev/null || true; \
    fi && \
    if [ -d /work/src/multiplier/scripts ]; then \
        cp -r /work/src/multiplier/scripts ${INSTALL_DIR}/ 2>/dev/null || true; \
    fi

RUN chmod +x ${INSTALL_DIR}/bin/* 2>/dev/null || true
ENV PATH="${INSTALL_DIR}/bin:${PATH}"

# Copy multiplier binaries from builder
FROM --platform=${PLATFORM} ${IMAGE} AS release
RUN apt-get update && \
    export DEBIAN_FRONTEND=noninteractive && \
    apt-get install -yq --no-install-recommends \
        nodejs \
        python3 \
        python3-pip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY --from=builder /work/install /work/install
COPY --from=builder /root/.foundry /root/.foundry
ENV PATH="/root/.foundry/bin:/work/install/bin:${PATH}"
