#!/bin/bash
kubectl delete -f manifests/ &
kubectl get pods -n jupyterapp -o name | grep -E '^pod/jp[a-z]{8}' | while read line; do
	line=${line#*/}
	line=${line%-deployment*}
	kubectl delete pod/$line \
		       ingress.networking.k8s.io/$line-ingress \
		       service/$line-service &
done

kubectl get pods -n jupyterapp -o name | grep -E '^pod/cronjob-' | while read line; do
	kubectl delete $line &
done
	
