#!/bin/bash
touch /var/lib/rabbitmq/.erlang.cookie
echo $ERLANG_COOKIE > /var/lib/rabbitmq/.erlang.cookie
rabbitmqctl -n rabbit@rabbitmq add_vhost /sensu
rabbitmqctl -n rabbit@rabbitmq add_user sensu mypass
rabbitmqctl -n rabbit@rabbitmq set_permissions -p /sensu sensu ".*" ".*" ".*"
