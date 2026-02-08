# Legacy C++ Files

This project has been converted from a C++ based code analysis tool to a Solidity smart contract analysis tool.

## Legacy Files

The following files are from the original C++ implementation and are kept for reference:

- `CMakeLists.txt` - C++ build configuration (CMake)
- `multiplierConfig.cmake.in` - CMake package configuration
- `cmake/` directory - CMake build scripts
- `vendor/` directory - C++ vendored dependencies
- `include/` directory - C++ header files
- `lib/` directory - C++ library implementations

## New Solidity Configuration

The project now uses the following configuration files for Solidity development:

- `package.json` - Node.js/npm package configuration
- `hardhat.config.js` - Hardhat configuration for Solidity development
- `foundry.toml` - Foundry configuration for Solidity development
- `.solhint.json` - Solidity linting configuration

## Migration Notes

If you need to use the original C++ implementation, please check out an earlier commit before this migration.
