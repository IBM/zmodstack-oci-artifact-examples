<!-- #
# Copyright 2023 IBM Inc. All rights reserved
# SPDX-License-Identifier: Apache2.0
# -->

# Steps to create the z/OS supported OCI Artifact

# Overview
In this example, a sample z/OS product pax file has been provided and included within the Containerfile, along with shell script files for illustration purposes. You may clone this repo to your local system and modify it as per your requirements. 

> **Note:** Currently, the IBM z/OS Package Manager supports only the z/OS Product pax file.

# IBM z/OS Package Manager build specification
The IBM z/OS Package Manager offers a build specififcation and the examples within this repository for you to create your own z/OS OCI artifacts for use with the IBM z/OS Package Manager, see [build specififcations](https://ibm.biz/BdSi3s).

## Repo Breakdown

```

├── zpm                         The zpm directory contains preinstall, install and uninstall shell scripts
│   ├── install.sh              Install shell script
│   ├── preinstall.sh           Preinstall shell script
│   └── uninstall.sh            Uninstall shell script
├── Containerfile               Podman Containerfile
├── dummy-zopen-git.zos.pax     z/OS Product pax file
├── install_test.sh             Install test shell script
└── README.md                   This file

```

You must include *LABEL community_unsupported=false* in the Containerfile to specify that the OCI artifact is supported by vendor.

## See also

For more information about *LABEL specification* , see [OCI Artifact specifications](https://ibm.biz/BdSigq).

For more information about Containerfile creation , see [Containerfile specifications](https://ibm.biz/BdSig8).

For more information about zpm/preinstall.sh script file creation , see [Preinstall shell script specifications](https://ibm.biz/BdSigw).

For more information about zpm/install.sh script file creation , see [Install shell script specifications](https://ibm.biz/BdSihj).

For more information about zpm/uninstall.sh script file creation , see [Uninstall shell script specifications](https://ibm.biz/BdSiC2).

For more information about zpm/install_test.sh script file creation , see [Install verification shell script specifications](https://ibm.biz/BdSiCM).

## Build the z/OS OCI artifact by using Podman tool

```sh
podman login $REGISTRY -u $YOURUSERID
podman build -t $REGISTRY/$NAMESPACE/javasdk:8.0.64.0 -f Containerfile
podman push "$REGISTRY/$NAMESPACE/javasdk:8.0.64.0"
```
> **Note**: Make sure to scan and sign the OCI artifact before publishing it.

## Finally, install the z/OS OCI artifact
The IBM z/OS Package Manager offers z/OS OCI artifact install capablities. For more information, please see [Installing products on z/OS with the IBM z/OS Package Manager](https://ibm.biz/BdSiCG).

## Copyright
© Copyright IBM Corporation 2023.
