1. prepare and install

https://docs.docker.com/engine/getstarted/step_one/#step-1-get-docker
https://docs.docker.com/engine/installation/
https://docs.docker.com/engine/installation/linux/ubuntulinux/

 $ sudo apt-get update
 $ sudo apt-get install apt-transport-https ca-certificates

   update docker-repo list


If you are installing on Ubuntu 14.04 or 12.04, apparmor is required. You can install it using: 

sudo apt-get install apparmor

-- config apt source

-- sudo apt-get install docker-engine

-- sudo service docker start

-- sudo docker run hello-world

-- Run docker ps -a to show all containers

2. create group

-- sudo groupadd docker
-- sudo usermod -aG docker ubuntu  or sudo gpasswd -a ${USER} docker
-- restart your system
-- sudo service docker restart
-- docker run hello-world


3. docker hub(a set of docker image)
https://docs.docker.com/engine/getstarted/step_three/
https://hub.docker.com/

how to build a private docker hub?

4. build own docker image
https://docs.docker.com/engine/getstarted/step_four/

---create build context directory
---create Dockerfile
---build docker build -t image-name .
---run docker run image-name
---docker images

5. tag and push images
---docker tag image-id docker-hub-name/image-name:tag-name
---docker login --username=xxx --email=xxx
Note: Your authentication credentials will be stored in the .docker/config.json authentication file in your home directory.

---docker push docker-hub-name/image-name
---images manage: docker hub repo

6. remove docker images
---docker rmi -f image-id|image-name
---docker pull docker-repo-name

7. docker-machine
https://docs.docker.com/machine/overview/
Docker Machine is a tool that lets you install Docker Engine on virtual hosts, and manage the hosts with docker-machine commands. 

Using docker-machine commands, you can start, inspect, stop, and restart a managed host, upgrade the Docker client and daemon,

Docker Machine: To deploy virtual machines that run Docker Engine.

----docker driver

8. Docker Swarm
Docker Swarm is native clustering for Docker. It turns a pool of Docker hosts into a single, virtual Docker host
https://www.docker.com/products/docker-swarm




