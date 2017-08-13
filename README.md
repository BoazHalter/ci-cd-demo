# ci-cd-demo
This is a basic DevOps CI\CD demo
it present 2 major Subject's CI/CD automated pipeline using :
- AWS EC2 - Instance As the main HOST of the following  
- Git - as our local developer SCM repository
- Jenkins - to orcastrate pipeline procedure
- Docker - Deployment environment
![Alt text](https://github.com/BoazHalter/ci-cd-demo/blob/master/CI-CD-infrastucture-architecture5.PNG "Arcitecture Overview:")

<br />
Tested on aws ec2 Amazon Linux ami<br />
- The stack described above will be the automated CI/CD pipe for this repo:<br />
  https://github.com/ivogabe/gulp-typescript<br />
  triggerd by developers code change<br />
Subject 1<br />
The pipeline runt-time procedures description<br />
- Step 1:<br />
    a hook file installed in .git/hooks/pre-push is executed ( Curl command to invoke jenkins job)<br />
    sudo pip install ansible<br />
- Step 2:<br />
    jenkins pipeline starting to run by default it clone the repo current state commit id and more info<br />
- Step 3:<br />
    jenkins pipeline build the source code using gulp tool<br />
- Step 4:<br />
    Unit Test <br />
- Step 5:<br />
    Docker build image<br />
- Step 6:<br />
    Deployment<br />
<br />
<br />
<br />

Subject 2:<br />
prerequisite: <br />
# Run Elasticsearch <br />
docker run -d -p 9200:9200 -e "http.host=172.31.35.204" -e "transport.host=127.0.0.1" elasticsearch:5.5.1 <br />
# Run kibana <br />
docker run  -e ELASTICSEARCH_URL=http://172.31.35.204:9200 -p 5601:5601 -d kibana <br />
# Run logstash <br />
docker run  -d -v /home/ec2-user/gitrepo/ci-cd-demo/:/config-dir  -v /home/mnt/docker/containers/:/usr/share/logstash/data logstash -f /config-dir/logstash.conf <br />
docker ps <br />

- ELK - Elasticsearch Logstash Kibana. <br />
  in this example ill use elk for centralize logging. <br />
  the logs of containers that runs on top of docker installed in previous steps.<br />  
  in order to see the logs on kibana web interface.<br />
- Step 1: <br />
  Check Elasticsearch indices browse to http://13.59.240.116:9200/_cat/indices <br />
   or:<br />
  Enter:<br />
    {<br />
	  curl -u elastic http://172.31.35.204:9200/_cat/indices <br />
	}  when prompt enter 'changeme' <br />
  Response:<br />
  {<br />
    Enter host password for user 'elastic': <br />
    yellow open logstash-2017.08.11 4RCShNYoTfawQhz3UpB0lw 5 1 1150305 0 162.3mb 162.3mb <br /> 
    yellow open .kibana             joZeQz_AQPiyVQbAdfBQhg 1 1       1 0   3.2kb   3.2kb <br />
  }<br />
    
	Notice: 'logstash-2017.08.11' < will use it next step <br />
- Step 2: <br />
  browse to kibana http://13.59.240.116:5601 . <br />
   
  ![Alt text](https://github.com/BoazHalter/ci-cd-demo/blob/master/kibanaIndex.PNG )
<br />
<br />
<br /> 
files in repo:
run.sh conatains run commands to run elk and jenkins used by me for testing dont run it as is use it 
to deploy elk

- In order to use this repo <br />
Step 1:<br />
  Enter: <br />
    pip install ansible<br /> 
  Response:<br />
    Pip installs Ansible correctly<br />
  Enter:<br />
    Ansible version<br />
  Response:<br />
    Ansible 2.2<br />
  Go to /etc/ansible/ansible.cfg and edit the : roles_path = /path/to/roles/dir<br />
  Enter:<br />
  ansible-playbook preinstall<br /> 

<br />
<br />
<br />
