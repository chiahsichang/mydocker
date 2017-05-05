
while [ 1 ]; do
   #wget --spider --retry-connrefused --waitretry=1 --read-timeout=20 --timeout=15 -t 0 --continue http://localhost:8080
   /apps/jboss-eap-6.4/bin/jboss-cli.sh --connect --controller=$jboss_domain --user=$jboss_username --password=$jboss_password --command="ls"
   if [ $? = 0 ]; then break; fi;
   sleep 1s;
done;

sleep 10s;

for file in /appdata/iapdata/deploy/*.war 
do 
    if [[ -f $file ]]; then 
        echo "deploying : "$file
        /apps/jboss-eap-6.4/bin/jboss-cli.sh -c --controller=$jboss_domain --user=$jboss_username --password=$jboss_password --command="deploy $file --server-groups=$group_name"
        /apps/jboss-eap-6.4/bin/jboss-cli.sh -c --controller=$jboss_domain --user=$jboss_username --password=$jboss_password --command="deployment-info --name=$(basename $file)"
    fi 
done

exit 0
