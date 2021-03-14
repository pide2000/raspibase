# raspiBase

Base configuration for raspberry pi projects.

## Initial Role 
Here we sum up every task which is essential in our opinion 

### User Mgmt

* remove pi user
* add ansible user if necessary
* add ssh user and public key

### security

* ufw: install, configure and activate
* sshd_conf: hardening the ssh security
* fail2ban: configuration and activation

### configure pi

* locales

### install basic software 

* git
* mosh
* Add software you want to install in vars/main.yml 

## wireguard [optional]

Configure our pi as wireguard client. 

## monitoring [optional]

WIP: Monitoring Software, maybe collectd, maybe telegraf, postgresql or influx connector.