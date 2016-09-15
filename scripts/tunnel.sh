#!/bin/bash

ssh -p 5869 -N -D 2020 -L8000:192.168.1.109:8000 root@ncmiller0.duckdns.org
