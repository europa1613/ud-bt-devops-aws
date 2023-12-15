```sh
ansible <group> -m <module>

ansible apache -m ping

---------------------Ad hoc Commands---------------------------------

ansible all -m command -a 'ls'
ansible all -m command -a 'pwd'

ansible agent1 -m  file -a 'path=/root/test.txt state=touch mode=0770 owner=root'
ansible agent1 -m  file -a 'path=/root/test state=directory mode=0770 owner=root'

ansible-doc -l
ansible-doc <module-name>
ansible agent -m setup -u root


-----------------------Install Apache----------------------------------
ansible all -m command -a "apt upgrade" #all to run on all agents

ansible agent1 -m command -a "apt update" # may command should be `apt-get -y update`
ansible agent1 -m command -a "apt upgrade" # may command should be `apt-get -y upgrade`
ansible agent1 -m command -a "apt install apache2" # may command should be `apt-get -y install apache2`

ansible agent1 -m service -a "name=apache2 state=started"

# open port Inbound 80 TCP on agent
# copy the host name put it in the browser

ansible agent1 -m command -a "apt -y remove apache2"

```