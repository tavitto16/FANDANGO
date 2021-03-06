#!/bin/bash
echo "Waiting for docker daemon to start up:"
until docker ps 2>&1| grep STATUS>/dev/null; do  sleep 1; done;  >/dev/null
docker ps -a | grep sandbox-hdp
if [ $? -eq 0 ]; then
 docker start sandbox-hdp
else
docker pull hortonworks/sandbox-hdp-standalone:2.6.4
docker run --name sandbox-hdp --hostname "sandbox-hdp.hortonworks.com" --privileged -d \
-p 15500:15500 \
-p 15501:15501 \
-p 15502:15502 \
-p 15503:15503 \
-p 15504:15504 \
-p 15505:15505 \
-p 1111:111 \
-p 4242:4242 \
-p 50079:50079 \
-p 6080:6080 \
-p 16000:16000 \
-p 16020:16020 \
-p 10502:10502 \
-p 33553:33553 \
-p 39419:39419 \
-p 15002:15002 \
-p 18080:18080 \
-p 10015:10015 \
-p 10016:10016 \
-p 2049:2049 \
-p 9090:9090 \
-p 3000:3000 \
-p 9000:9000 \
-p 8000:8000 \
-p 8020:8020 \
-p 2181:2181 \
-p 42111:42111 \
-p 10500:10500 \
-p 16030:16030 \
-p 8042:8042 \
-p 8040:8040 \
-p 2100:2100 \
-p 4200:4200 \
-p 4040:4040 \
-p 8032:8032 \
-p 9996:9996 \
-p 9995:9995 \
-p 8080:8080 \
-p 8088:8088 \
-p 8886:8886 \
-p 8889:8889 \
-p 8443:8443 \
-p 8744:8744 \
-p 8888:8888 \
-p 8188:8188 \
-p 8983:8983 \
-p 1000:1000 \
-p 1100:1100 \
-p 11000:11000 \
-p 10001:10001 \
-p 15000:15000 \
-p 10000:10000 \
-p 8993:8993 \
-p 1988:1988 \
-p 5007:5007 \
-p 50070:50070 \
-p 19888:19888 \
-p 16010:16010 \
-p 50111:50111 \
-p 50075:50075 \
-p 50095:50095 \
-p 18081:18081 \
-p 60000:60000 \
-p 8090:8090 \
-p 8091:8091 \
-p 8005:8005 \
-p 8086:8086 \
-p 8082:8082 \
-p 60080:60080 \
-p 8765:8765 \
-p 5011:5011 \
-p 6001:6001 \
-p 6003:6003 \
-p 6008:6008 \
-p 1220:1220 \
-p 21000:21000 \
-p 6188:6188 \
-p 2222:22 \
-p 7474:7474 \
-p 7687:7687 \
-p 7473:7473 \
hortonworks/sandbox-hdp-standalone:2.6.4 /usr/sbin/sshd -D
# #!/bin/bash
# if [ hash ssh 2>/dev/null ]; then
# 	echo " requirement ssh installed"
# else
# 	sudo apt-get install ssh
# fi
# if [ hash git 2>/dev/null ]; then
# 	echo " requirement git installed"
# else
# 	sudo apt-get install git
# fi
# git clone https://github.com/cas-bigdatalab/ambari-neo4j.git
# mkdir NEO4J
# cp -r ambari-neo4j/*  NEO4J
# docker cp -r NEO4J 
#ssh maria_dev@localhost -p 2222
#for  NIFI
docker exec -t sandbox-hdp sh -c "cd /var/lib/ambari-server/resources/stacks/HDP/2.6/services/ && git clone https://github.com/tavitto16/FANDANGO &&  mv NIFI/package/scripts/params.py NIFI/package/scripts/params.py.backup && cp FANDANGO/HDP/NIFI/params.py NIFI/package/scripts/ && rm -r FANDANGO/* "
#for NEO4J
docker exec -t sandbox-hdp sh -c "cd /var/lib/ambari-server/resources/stacks/HDP/2.6/services && mkdir NEO4J && git clone https://github.com/cas-bigdatalab/ambari-neo4j.git &&  cp -r ambari-neo4j/*  NEO4J && rm -r ambari-neo4j/* "
fi
docker exec -t sandbox-hdp /root/start-sandbox-hdp.sh