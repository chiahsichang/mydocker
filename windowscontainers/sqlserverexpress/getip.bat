@echo off
docker inspect --format "{{ .NetworkSettings.Networks.nat.IPAddress }}" %1