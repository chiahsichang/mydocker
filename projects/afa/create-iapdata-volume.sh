#docker volume create --driver local --opt type=nfs --opt o=addr=10.82.110.23,ro --opt device=:/appdata/iapdata/config iapdata_config
docker volume create --driver local --opt type=nfs --opt o=addr=10.82.110.23,rw --opt device=:/appdata/iapdata/logs/sso iapdata_logs
