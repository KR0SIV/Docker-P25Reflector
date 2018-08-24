# A P25Reflector Living in a Docker Container

I wanted a simple way to quickly deploy P25Reflectors to create several talk groups on our local MMDVM driven P25 repeater.
The reflector was written by https://github.com/g4klx/P25Clients I just compiled it and wrapped it into a docker container for ease of deployment.

## Prerequisites

1. Install [Docker][].

[Docker]: http://docker.com/

## Running

Run the line below to start the container, it will download it for you if it does not exist locally.

    docker run --name TG50100 -id -p 41000:41000/udp corrosive/docker-p25reflector

You may wish to change several parameters before executing the above command.
The --name field is the name of your container, in this case I've named it to match my repeater talk group TG50100
The -p field contains the internal and external port numbers used to run the server, you may wish to change the first port listed especially if you plan to run multiple talkgroups/servers.

To ensure your container is running execute the following command.

    docker ps

## Starting with your system

You may wish to start the server on boot, there are varying way to do this but here it what worked for me.
I first created a container for each server I wanted to run, in this example lets say you have 3 servers using 3 different ports.

    docker run --name TG50100 -id -p 41000:41000/udp corrosive/docker-p25reflector
    docker run --name TG50101 -id -p 41001:41000/udp corrosive/docker-p25reflector    
    docker run --name TG50102 -id -p 41002:41000/udp corrosive/docker-p25reflector    
    
This would create 3 servers for use as 3 seperate talk groups. You would then create an sh script to restart each container that would be executed on system start up.

    nano start_reflectors.sh
   
Inside this file you would have the following

    docker restart TG50100
    docker restart TG50101    
    docker restart TG50102

(Save this file with Ctrl+x)

Then we edit our cron to execute on start up... run

    crontab -e
    
If prompted just select to use nano, and then add the following to the end of your cron file.

    @reboot /home/your_user_directory/start_reflectors.sh
    
The location is arbitrary and you can place things where you like, this is just what worked for me.
Now simply restart your server and ensure the servers/talkgroups have started with
    
    docker ps
    
    
