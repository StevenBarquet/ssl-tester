cd /home/botz/ssl-tester
git pull origin feature-letsEncrypt
docker container ls
docker container rm -f ssl-test-container
docker image ls
docker image rm -f ssl_test_image
docker build -t ssl_test_image .
docker image ls
docker container ls
docker container logs ssl-test-container
docker container inspect ssl-test-container


## With host volume for ssl files
docker run --name ssl-test-container -p 443:5000 -d \
  --mount type=bind,source=/etc/letsencrypt/live/shelly-store.com,target=/etc/letsencrypt/live/shelly-store.com \
  --mount type=bind,source=/etc/letsencrypt/archive/shelly-store.com,target=/etc/letsencrypt/archive/shelly-store.com \
  ssl_test_image

  ssh root@134.122.112.35


