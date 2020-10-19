#!/bin/sh
helm delete nfs
helm install nfs stable/nfs-server-provisioner -f ../nfsoptions.yaml
