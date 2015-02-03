#!/bin/bash
rabbitmqctl -n rabbit@rabbitmq add_vhost /sensu
rabbitmqctl -n rabbit@rabbitmq add_user sensu mypass
rabbitmqctl -n rabbit@rabbitmq set_permissions -p /sensu sensu ".*" ".*" ".*"
