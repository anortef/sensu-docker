#!/bin/bash
chmod +x /tmp/rabbitmqadmin
/tmp/rabbitmqadmin -H rabbitmq declare vhost name=/sensu
/tmp/rabbitmqadmin -H rabbitmq declare user name=sensu password=mypass tags=sensu
/tmp/rabbitmqadmin -H rabbitmq declare permission vhost=/sensu user=sensu configure=".*" write=".*" read=".*"
