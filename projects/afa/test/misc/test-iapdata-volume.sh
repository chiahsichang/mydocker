#docker run --rm -v sso_iapdata_config:/appdata/iapdata/config -it 10.82.20.11:5000/cht/centos:7 bash
docker run --rm -v iapdata_logs:/appdata/iapdata/logs/sso -it 10.82.20.11:5000/cht/centos:7 bash
