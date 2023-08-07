DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins

echo 'Get latest version'
LATEST_VER=$(python -<<EOF
import requests
import re

t = requests.get("https://github.com/docker/compose/tags")
try:
    tag = re.search(
        r'<a href="/docker/compose/releases/tag/v\d+.\d+.\d+">', t.text)[0]
    tag = re.search(r'v\d+.\d+.\d+', tag)[0]
    print(tag)
except TypeError:
    print("Error: could not find version number")
EOF
)
echo "Latest version is: $LATEST_VER"
echo "Download latest version"

curl -SL https://github.com/docker/compose/releases/download/$LATEST_VER/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
