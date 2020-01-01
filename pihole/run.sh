#!/bin/bash

# Modified from https://github.com/pi-hole/docker-pi-hole/blob/master/README.md

VERSION=4.3.2-1
LOCAL_IP=$(hostname -I | cut -d' ' -f1)

docker run -d \
    --name pihole \
    -p 53:53/tcp -p 53:53/udp \
    -p 80:80 \
    -p 443:443 \
    --env-file ".env" \
    -v "$(pwd)/etc-pihole/:/etc/pihole/" \
    -v "$(pwd)/etc-dnsmasq.d/:/etc/dnsmasq.d/" \
    --dns=127.0.0.1 --dns=1.1.1.1 \
    --add-host raspberrypi:$LOCAL_IP \
    --add-host pi.hole:$LOCAL_IP \
    --restart=unless-stopped \
    pihole/pihole:$VERSION

printf 'Starting up pihole container '
for i in $(seq 1 20); do
    if [ "$(docker inspect -f "{{.State.Health.Status}}" pihole)" == "healthy" ] ; then
        printf ' OK'
        echo -e "\n$(docker logs pihole 2> /dev/null | grep 'password:') for your pi-hole: https://${IP}/admin/"
        exit 0
    else
        sleep 3
        printf '.'
    fi

    if [ $i -eq 20 ] ; then
        echo -e "\nTimed out waiting for Pi-hole start, consult check your container logs for more info (\`docker logs pihole\`)"
        exit 1
    fi
done;
