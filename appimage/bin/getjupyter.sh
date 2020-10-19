#!/bin/sh

name="$(bin/getname.sh)"

manifest_path="/var/nfs/inuse/$name.yaml"

if [ "$1" == x86 ]; then
	image="jupyter/scipy-notebook"
elif [ "$1" == arm ]; then
	image="intel01:5000/jupyterlab-arm"
fi

sed -e "s|{{ name }}|$name|g" \
		        -e "s|{{ architecture }}|$1|g" \
		        -e "s|{{ image }}|$image|g" \
		        "manifests/jupytertemplate.yaml" | \
			tee "$manifest_path" | kubectl create -f - >&2

while ! (kubectl logs -l name=$name | grep -q "?token="); do 
	sleep "1"
done

url="https://$name.192-168-1-105.sslip.io/lab$(kubectl logs -l name=$name | grep -o '?token=.*' | head -n1)"

while ! (curl -X GET -INsk $url | head -n1 | grep -wq '2[0-9][0-9]'); do
	sleep "1"
done

echo -n $url
