#!/bin/bash

# start consul
./swarm_up_consul.sh

# start manager
./swarm_up_manager.sh

# start join node to manager
./swarm_up_join.sh

#
./swarm_up_registrator.sh

#
./swarm_up_dockerui.sh

