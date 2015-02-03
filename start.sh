#!/bin/bash

service sensu-server start
service sensu-api start
service sensu-client start
service uchiwa start
tail -f /var/log/sensu/sensu-server.log
