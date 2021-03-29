Wireguard-Client
=========

A role to install and configure a wireguard client on a raspberry pi.  

Requirements
------------

You need an running wireguard server and you have to configure the client as a peer on the wireguard server. 

Role Variables
--------------

###Defaults
The defaults should be overwritten in vars/main.yml

----

`wireguard_conf_path: "/etc/wireguard/"`    
The Path where all the wg configuration is stored

`wireguard_credentials_file: "wg.credentials"`    
The file name where all credentials for the clients are stored. This is NOT necessary for wireguard to run properly. It is just for cenvenience because one can see all the configuration parametes in one place. E.g. the generated public key for the client. 

`wireguard_conf_file: "wg.conf"`    
The name of the wireguard configuration file and therefore the name to start the wireguard client with `wg-quick up wg`.

`private_ip:`    
The IP in the wireguard VPN.

`server_ip:`    
The public IP of your wireguard server.

`wg_port:`    
The wireguard wg_port.

`server_public_key:`    
The public key of the wireguard server.

`allowed_ips_`     
Allowed Ips which are routed through wireguard. E.g. 0.0.0.0, 10.100.100.0/24 

`mtu:`     
Wireguard has no automatic mtu discovery, this can lead to strange problems. E.g. vim is unusable. Therefore the mtu can be set to a specific value. I discovered a mtu 1285 for miy pis. So this will be the default here.

`persistent_keepalive:`    
Sets the persistent keepalive value of wireguard in seconds. 


Dependencies
------------

Not necessary

License
-------

GPL V2
