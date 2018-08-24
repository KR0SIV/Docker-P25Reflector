# A P25Reflector Living in a Docker Container

I wanted a simple way to quickly deploy P25Reflectors to create several talk groups on our local MMDVM driven P25 repeater.
The reflector was written by https://github.com/g4klx/P25Clients I just compiled it and wrapped it into a docker container for ease of deployment.

## Prerequisites

1. Install [Docker][].

[Docker]: http://docker.com/

## Running

Run the line below to start the container, it will download it for you if it does not exist locally.

    docker run -d -p 41000:41000 corrosive/docker-p25reflector

You may wish to change the internal and external port numbers. The first port is the external port you wish the service to be available at. The second port number is the interal port and should not be changed.
Run the following to ensure the image has executed properly.

    docker ps
