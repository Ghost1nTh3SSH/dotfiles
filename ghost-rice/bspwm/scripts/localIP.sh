#!/usr/bin/env bash

echo "$(/usr/sbin/ifconfig eth0 | grep "inet " | awk '{print $2}')"
