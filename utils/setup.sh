#!/bin/bash
kubectl apply -f ../onetimemanifests/
helm install nfs stable/nfs-server-provisioner -f ../nfsoptions.yml
