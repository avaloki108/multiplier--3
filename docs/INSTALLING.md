# Installing the Multiplier SDK

The Multiplier SDK has been tested on Ubuntu 23.10+. You can install it via npm
or use the standalone installer package.

## Installing via npm

```shell
npm install -g @multiplier/sdk
```

## Installing via standalone package

Run the following command to install the standalone package:

```shell
sudo apt install ./multiplier-solidity-2.0_1.linux_x86_64.deb
```

If you see an error such as: "Download is performed unsandboxed as root" then
you can fix it in one of two ways. The simplest and least intrusive way to fix
this is by moving the `.deb` file into your `/tmp` directory, and then install
it from there. Alternatively, you can run the following command:

```shell
sudo chown -R _apt:root /var/lib/apt/lists
```

The above command will install the Multiplier SDK into the `/opt/multiplier`
directory. For example, Multiplier's build indexer will be installed to
`/opt/multiplier/bin/mx-index`.

Over time, the package version numbers are likely to change so you will need to
adjust the `.deb` file name. For the sake of simplicity in packaging, the SDK
includes all of Multiplier's vendored dependencies.

You can use dpkg to install the debian package as well. In case you encounter
issues related to missing dependencies, force install them using `apt`.

```shell
sudo dpkg -i multiplier-solidity-2.0_1.linux_x86_64.deb
sudo apt install -f   # if you see error related to dependencies
```
