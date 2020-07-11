# :white_check_mark: FT_SERVER (Project 2020)
## Description
This topic is intended to introduce you to system administration. It will make you aware
of the importance of using scripts to automate your tasks. For that, you will discover
the "docker" technology and use it to install a complete web server. This server will run
multiples services: Wordpress, phpMyAdmin, and a SQL database.  

## Installing docker on Linux
* Before proceeding to install the program itself, you need to update the system to the current state. To do this, run:   
`sudo apt update && sudo apt upgrade`  
* Before installing Docker, you must install additional kernel packages that allow you to use Aufs for Docker containers. We can use this file system to track changes and take snapshots of containers:  
`sudo apt install linux-image-extra-$(uname -r) linux-image-extra-virtual`  
* You also need to install the packages required for apt to work over https:  
`sudo apt install apt-transport-https ca-certificates curl software-properties-common`  
* After all the preparations are completed and you are sure that your system is completely ready, you can proceed to installation. We will install the program from the official developer repository. First you need to add the repository key:  
`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`  
* Then add the docker repository to the system:  
`sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"`  
`sudo apt update && apt-cache policy docker-ce`  
* And installing Docker on Linux:  
`sudo apt install -y docker-ce`  
  
P.s. To complete the installation, we just need to add our user to the docker group. Otherwise when you start the utility you will get an error connecting to the socket:  
![](https://github.com/markveligod/ft_server/raw/master/img/1.png)  
  
To add it, run: `sudo usermod -aG docker $(whoami)`  
![](https://github.com/markveligod/ft_server/raw/master/img/2.png)  
  
Then we check whether the service is running:  `sudo systemctl status docker`  
![](https://github.com/markveligod/ft_server/raw/master/img/3.png)  

## Installing docker on Mac OS
Open managed software center and download Docker Toolbox  

## Installing nginx php sql wordpress using Docker  
* Clone a repository `git clone https://github.com/markveligod/ft_server.git`
* Go to the "ft_server" folder
* To run `bash start.sh`  
  
![](https://github.com/markveligod/ft_server/raw/master/img/4.png)  
![](https://github.com/markveligod/ft_server/raw/master/img/5.png)  
![](https://github.com/markveligod/ft_server/raw/master/img/6.png)  
![](https://github.com/markveligod/ft_server/raw/master/img/7.png)  
![](https://github.com/markveligod/ft_server/raw/master/img/8.png)  
P.s. This project was made and tested under Ubuntu 20.04.  
For Mac OS I recommend replacing in `main.html` the line `localhost` to the IP address allocated by Docker toolbox.  
  
## Other  
  
**Author:** *[Mark Veligod](https://github.com/markveligod)* 
