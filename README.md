raspiBase
====

Base configuration for raspberry pi projects. 
The idea behind this project is to configure a pi with all the basic stuff needed to kickstart a project. 
The focus lies on headless raspiOS projects.  

#### Quick Start
* Configure the values needed
* Run ansible playbook with 
```ansible-playbook -i inventories/hosts site.yml -l pi```

If you want  to exclude optional roles, use for example    
`ansible-playbook site.yml -i inventories/hosts -l raspi --tags "initial"`
to restrict the anbsible run to the role initial

## Initial Role 
Here we sum up every task which is essential in our opinion. 

### User Mgmt

* remove pi user
* We add an dedicated ansible user to connect to the pi with ansible
* add ssh user and public key

### security

* ufw: install, configure and activate
* sshd_conf: hardening the ssh security
* fail2ban: configuration and activation

### configure pi

* locales

### configure ufw

* firewall configuration for mosh and ssh

### journald configuration

configuration of log rotation etc. 

### install basic software 

* git
* mosh
* ufw
* vim

### Variables

`upgrade`    
Upgrade RaspiOS? Yes/No

`update_apt_cache`   
Update apt cache? Yes/No

#### ssh user settings
`ansible_user_name`
The username which is used by ansible to connect to the raspberry

`ansible_user`
The ansible user actually used, this is needed to set the user either to pi or to ansible_user_name on first run.

`ssh_user`
The name of the ssh user

`user_ssh_public_key`
ssh public key of the ssh user

`ansible_ssh_public_key`
ssh public key of the ansible user

#### ssh config settings

For in depth information take a look at: https://www.ssh.com/ssh/config/

`permit_empty_passwords`   
`max_auth_tries`    
`login_grace_time`    
`password_authentication`    
`x11_forwarding`    
`ssh_port`    

#### Software
`software`
List of mandatory software which will be installed 

#### ufw
`allowed_services`    
Here one can define ufw rules to allow services


## wireguard [optional]

Configure our pi as wireguard client. 
see README in wireguard role for more information and configuration

## monitoring [optional]

WIP: Monitoring Software, maybe collectd, maybe telegraf, postgresql or influx connector.

License
-------

GPL V2