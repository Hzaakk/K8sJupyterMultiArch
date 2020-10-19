#!/bin/bash
diff <(docker ps -aq) <(docker ps -q) | sed '1d' | sed 's/< //' | xargs -n1 docker rm
