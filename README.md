# Kakashi Swap

Kakashi Swap is a decentralized exchange (DEX) built on top of StarkNet, utilizing the minimal Cairo 1.0 template for smart contract development. This project leverages the power of StarkNet and the advanced features provided by Cairo 1.0 to create a cutting-edge DEX experience.

## Features

- Minimal template using Cairo 1.0 and the [alexandria](https://github.com/keep-starknet-strange/alexandria) project defaults.
- Built-in support for the `protostar` toolchain for running tests.
- Utilizes the Scarb package manager for reusability and integrates Scarb dependencies for libraries.
- Offers reproducible builds through GitHub Actions.
- Includes advanced debugging views like the Sierra intermediate representation.

## Getting Started

To start working with Kakashi Swap, follow these steps:

1. Install the Cairo package manager Scarb. Refer to the installation guide in [Scarb's documentation](https://docs.swmansion.com/scarb).

2. Install the Protostar toolchain. Follow the installation guide in [Protostar's Repository](https://github.com/software-mansion/protostar).

3. Install Cairo 1.0 using the provided guide by [Abdel](https://github.com/abdelhamidbakhta). This step ensures an independent version of Cairo. You can find the installation instructions in the README.md file.

4. Add Cairo 1.0 executables to your system's path. Instructions are provided in the README.md file.

5. Set up the Language Server. The instructions include setting up the VS Code extension and ensuring the Cairo Language Server is available on your system.

## Usage

Once you have set up Kakashi Swap, you can use the following commands:

- **Build**: Use `scarb build` to build the contracts.

- **Test**: Run the tests in `src/test` using `scarb run test`.

- **Format**: Format the Cairo source code using Scarb with the command `scarb fmt`.

- **Sierra and Casm**: The template automatically builds the Sierra output of your Cairo code. You can configure this behavior in the `Scarb.toml` configuration file. Instructions are provided in the README.md file.

## Acknowledgments

Kakashi Swap is built by the Kakashi Team during the Pragma Hackathon.

## License

Kakashi Swap is released under the [MIT License](https://github.com/auditless/cairo-template/blob/main/LICENSE).
