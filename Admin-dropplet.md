sudo git pull origin master
docker container ls
docker container rm -f ssl-test-container
docker image ls
docker image rm -f ssl_test_image
docker build -t ssl_test_image .
docker image ls
docker run --link shelly-mongo:mongo --name shelly-back2 --network shelly-network -p 5000:5000 -d shelly_back_image
docker container ls
docker container logs ssl-test-container

check changes done in postman

## Not contenerized DB
docker run --name ssl-test-container -p 4000:4000 -d ssl_test_image
docker container logs ssl-test-container

## Not contenerized DB with localhost access
	docker run --network host --name shelly-back2-container -p 5000:5000 -d shelly_back_image
	docker container logs shelly-back2-container

## With host volume for ssl files
docker run --name ssl-test-container -p 80:80 -d \
  --mount type=bind,source=/home/botz/certificates,target=/home/botz/certificates,readonly \
  ssl_test_image

  ssh root@174.138.49.191

