<!-- #
# Copyright 2023 IBM Inc. All rights reserved
# SPDX-License-Identifier: Apache2.0
# -->

# Examples for z/OS OCI Artifact
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](./LICENSE)

# Overview
The [IBM z/OS Package Manager](https://ibm.biz/BdSiCG) is part of the [IBM Z® and Cloud Modernization Stack](https://ibm.biz/BdSi3g). The IBM Z® and Cloud Modernization Stack offering uses z/OS OCI artifacts to install software (or a product) onto z/OS systems using the IBM z/OS Package Manager.

An OCI artifact is similar to an OCI container image. An OCI artifact contains software (or a product) that is stored as a non-image type within an OCI registry.

The z/OS Package Manager build specification offers to build suported and unsupported types of z/OS OCI artifacts.

Refer to the z/OS Package Manager [build specification](https://ibm.biz/BdSi3s) to build a z/OS OCI artifact using the Podman tool on platforms other than z/OS. These OCI artifacts can only be run by using IBM z/OS Package Manager.

You can refer to the following examples in this repository before trying your own z/OS OCI artifact.

  + [Supported z/OS OCI artifact](./java-supported/README.md)
  + [Unsupported z/OS OCI artifact](./git-unsupported/README.md)

## Content of the z/OS OCI artifact code

```

├── zpm                               The zpm directory contains preinstall, install, and uninstall shell scripts
│   ├── install.sh                    Install shell script
│   ├── preinstall.sh                 Preinstall shell script
│   └── uninstall.sh                  Uninstall shell script
├── Containerfile                     Podman Containerfile
├── product.zos.pax.Z                 z/OS Product pax file
├── install_test.sh                   Install test shell script
└── README.md                         This file

```

## Copyright
© Copyright IBM Corporation 2023.

