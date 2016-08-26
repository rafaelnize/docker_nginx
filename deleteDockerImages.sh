#!/bin/bash

/usr/bin/docker rmi -f $(/usr/bin/docker images -q)
