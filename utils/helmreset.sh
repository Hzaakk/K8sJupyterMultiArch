#!/bin/sh
helm delete nfs
sleep 3
helm install nfs stable/nfs-server-provisioner -f nfsoptions.yaml
