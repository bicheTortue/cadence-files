# Cadence files

This repo contains two files used to import the [netlists](../../../NN-netlist-generator/) in Cadence's Virtuoso along with the library containing all the component needed to follow up on my [master thesis](https://github.com/bicheTortue/MSc-thesis/releases/download/Final/thesis.pdf).

## Table of Contents

- [Usage](#usage)

- [Importing](#importing)

- [License](#license)

## Usage

Download or clone the repo at the root of your Cadence's Virtuoso project.

## Importing

To import the `barbaLib` library in Cadence's Virtuoso, there are two options :

### Using the command line

The library can be added by typing `ddCreateLib("barbaLib","./barbaLib")` in the console window of Cadence's Virtuoso.

### Using the graphical interface

- Select `Tools` then `Library Path Editor` in the toolbar of the console window.

- In the new window, add the entry for the library by typing the name and path in the corresponding cell.

- Save and exit the `Library Path Editor` window.

## License

This project is licensed under the General Public License, version 3.0 or later - see the [COPYING](./COPYING) file for details.
