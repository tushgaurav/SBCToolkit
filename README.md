# SBCToolkit

Setup scripts for different SBCs

## Intro
This repository contains setup scripts for different Single Board Computers (SBCs) like Raspberry Pi, Odroid, etc. The scripts are intended to be used to setup a new SBC with the necessary software and configurations for a basic setup.

## Usage
To run the setup script, you may either download and run the script manually depending upon the SBC you are setting up.

#### Raspberry Pi
you may either download and run the 'pi-setup.sh' script manually, or use the following cURL or Wget command:

```bash
curl -sSL https://raw.githubusercontent.com/tushgaurav/SBCToolkit/refs/heads/main/pi-setup.sh | bash
```

```bash
wget -qO- https://raw.githubusercontent.com/tushgaurav/SBCToolkit/refs/heads/main/pi-setup.sh | bash
```

