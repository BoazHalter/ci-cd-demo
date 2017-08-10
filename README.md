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

Run Time Procedures
- Step 1:
    a hook file installed in .git/hooks/pre-push is executed ( Curl command to invoke jenkins job)
    sudo pip install ansible
- Step 2:
    jenkins pipeline starting to run by default it clone the repo current state commit id and more info
    #run ansible playbook installPrerequisites
- Step 3:
    jenkins pipeline build the source code using gulp tool
- Step 4:

