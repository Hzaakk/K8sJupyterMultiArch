#!/bin/bash
ansible all -m apt -a 'name=nfs-common state=latest'
kubectl apply -f ../onetimemanifests/
helm install nfs stable/nfs-server-provisioner -f ../nfsoptions.yml
