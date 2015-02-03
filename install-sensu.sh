#!/bin/bash
wget -q http://repos.sensuapp.org/apt/pubkey.gpg -O- | apt-key add -
echo "deb     http://repos.sensuapp.org/apt sensu main" > /etc/apt/sources.list.d/sensu.list

apt-get update
apt-get install sensu uchiwa rabbitmq-server -y
if [ -n "${CREATE_QUEUE+1}" ]; then
    if [ "$CREATE_QUEUE" = true ]; then
        echo "Preparing rabbit..."
        chmod +x /tmp/preparerabbit.sh
        /tmp/preparerabbit.sh
    else
        echo "Rabbit already prepared"
    fi
else
    echo "Not specified if rabbit is prepared or not. Ignoring..."
fi
chown -R sensu:sensu /etc/sensu/
