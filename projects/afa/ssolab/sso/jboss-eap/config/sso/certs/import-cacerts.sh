$JAVA_HOME/bin/keytool -delete -noprompt -alias afa -keystore $JAVA_HOME/jre/lib/security/cacerts -storepass changeit
OUT=$?
$JAVA_HOME/bin/keytool -importcert -noprompt -alias afa -file /appdata/iapdata/config/sso/certs/iap.afa.gov.tw.crt -keystore $JAVA_HOME/jre/lib/security/cacerts -storepass changeit
OUT=$?
exit 0
