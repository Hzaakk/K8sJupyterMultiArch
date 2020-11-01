#!/bin/bash
kubectl delete -f manifests/ &
for i in service ingress pod; do
        kubectl get $i -n jupyterapp -o name | grep -E '^.*?/jpr[a-z]{8}' | while read line; do
                kubectl delete $line &
        done
done

kubectl get pods -n jupyterapp -o name | grep -E '^pod/cronjob-' | while read line; do
        kubectl delete $line &
done
