image_version=`date +%Y%m%d%H%M`;
echo $image_version;
# cd mywebapp
git pull --rebase origin master;
docker stop mywebapp;
docker rm mywebapp;
docker build -t mywebapp:$image_version .;
docker images;
docker run -p 10001:80 -d --name mywebapp mywebapp:$image_version;
# -v ~/docker-data/house-web/appsettings.json:/app/appsettings.json -v ~/docker-data/house-web/NLogFile/:/app/NLogFile   --restart=always
docker logs mywebapp;
#删除build过程中产生的镜像    #docker image prune -a -f
docker rmi $(docker images -f "dangling=true" -q)