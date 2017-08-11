# ci-cd-demo
This is a basic DevOps CI\CD demo
it present the use of :
- AWS EC2 - Instance As the main HOST of the following  
- Git - as our local developer SCM repository
- Jenkins - to orcastrate pipeline procedure
- Docker - Deployment environment
![Alt text](https://github.com/BoazHalter/ci-cd-demo/blob/master/CI-CD-infrastucture-architecture5.PNG "Arcitecture Overview:")

- The stack described above will be the automated CI/CD pipe for this repo:
  https://github.com/ivogabe/gulp-typescript
  triggerd by developers code change
- In order to use this repo run: pip install ansible  
Run Time Procedures
- Step 1:
    a hook file installed in .git/hooks/pre-push is executed ( Curl command to invoke jenkins job)
    sudo pip install ansible
- Step 2:
    jenkins pipeline starting to run by default it clone the repo current state commit id and more info
- Step 3:
    jenkins pipeline build the source code using gulp tool
- Step 4:
    Unit Test 
- Step 5:
    Docker build image
- Step 6:
    Deployment

- ELK - Elasticsearch Logstash Kibana.
  in this example ill use elk for centralize logging. 
  the logs of containers that runs on top of docker installed in previous steps.  
  in order to see the logs on kibana web interface.
- Step 1:
  Check Elasticsearch indices browse to http://13.59.240.116:9200/_cat/indices
  or:
  Enter:
    curl -u elastic http://172.31.35.204:9200/_cat/indices when prompt enter 'changeme'
  Response:
    Enter host password for user 'elastic':
    yellow open logstash-2017.08.11 4RCShNYoTfawQhz3UpB0lw 5 1 1150305 0 162.3mb 162.3mb
    yellow open .kibana             joZeQz_AQPiyVQbAdfBQhg 1 1       1 0   3.2kb   3.2kb
    use the 'logstash-2017.08.11' 
- Step 2:
  browse to kibana http://13.59.240.116:5601 . 
   
  ![Alt text](https://github.com/BoazHalter/ci-cd-demo/blob/master/kibanaIndex.PNG )
 
   
