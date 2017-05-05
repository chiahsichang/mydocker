#!/bin/bash

if [ $DOMAIN_MODE == "gossip" ];then
java -classpath $JBOSS_HOME/modules/system/layers/base/org/jboss/logging/main/jboss-logging-3.1.4.GA-redhat-2.jar:$JBOSS_HOME/modules/system/layers/base/org/jgroups/main/jgroups-3.2.13.Final-redhat-1.jar -Djava.net.preferIPv4Stack=true org.jgroups.stack.GossipRouter -port 12001
elif [ $DOMAIN_MODE == "slave" ];then
gosu 1002:1002 $JBOSS_HOME/bin/domain.sh -b=0.0.0.0 -bmanagement=0.0.0.0 -Djgroups.bind_addr=`hostname -i` --host-config=host-slave.xml -Djboss.domain.master.address=`echo ${DOMAIN_MASTER_HOST}` -Dcht.security.sso.casHost=$CAS_HOST -Dcht.security.sso.casClientHost=$CASCLIENT_HOST
#gosu 1002:1002 $JBOSS_HOME/bin/domain.sh -b=0.0.0.0 -bmanagement=0.0.0.0 -Djgroups.bind_addr=`hostname -i | awk '{print $3}'` -Djboss.node.name=`hostname` --host-config=host-slave.xml -Djboss.domain.master.address=`echo ${DOMAIN_MASTER_HOST}`
elif [ $DOMAIN_MODE == "master" ];then
gosu 1002:1002 $JBOSS_HOME/bin/domain.sh -b=0.0.0.0 -bmanagement=0.0.0.0 -Djgroups.bind_addr=`hostname -i` --host-config=host-master.xml
#gosu 1002:1002 $JBOSS_HOME/bin/domain.sh -Djboss.node.name=`hostname` -b=0.0.0.0 -bmanagement=0.0.0.0 -Djgroups.bind_addr=`hostname -i | awk '{print $3}'` --host-config=host-master.xml
else
echo "DOMAIN_MODE = {'master', 'slave', 'gossip' }"
exit 0
fi

