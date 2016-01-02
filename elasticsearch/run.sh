sudo docker run -i -d --hostname=es_master --name=es_master -p 9200:9200 -p 9300:9300 -e CLUSTER_NAME=ELK shona/es
