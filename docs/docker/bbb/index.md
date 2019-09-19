TI BeagleBone Black Buildroot on Docker
====

### Docker
---

  - **Account**    
    Login: brainchildralph / **********    
    Repository: brainchildralph/work:bbb    

  - **Docker Container**    
    - Install docker on your Ubuntu system  
    - Because this is private repository, please key in login command first.   
      screenshot:       
      ```
      # docker login
      Login with your Docker ID to push and pull images from Docker Hub. If you don't have 
      a Docker ID, head over to https://hub.docker.com to create one.
      Username: brainchildralph
      Password:
      WARNING! Your password will be stored unencrypted in /root/.docker/config.json.
      Configure a credential helper to remove this warning. See
      https://docs.docker.com/engine/reference/commandline/login/#credentials-store
      
      Login Succeeded
      ```
    - After login, please download the files by [the link](https://github.com/bcralph/work/tree/master/Dockerfile/brainchildralph/bbb).     
      The simple steps to create docker are list as below:   
      ```
      # ./run.sh
      # ./start.sh
      # ./bash.sh         # This will make you enter the bash shell in interactive mode.     
      
      ```    
   - The shared folder between host and docker will be under the scripts folder called     
     'share', and the related path in docker is '/share'. You can modify the 'run.sh' 
     for such configurations. 

  - **Buildroot**    
    - Build SD Card image    
      ```
      # cd /work/buildroot/build
      # make 
      ...
      
      ```    
   - Wait for makeing image done... (It depends on your computing power, and the download speed. )    
   - Image will locate as below:     
     - /work/buildroot/build/output/beaglebone/buildroot/output/images/sdcard.img      
     ```
     # ls /work/buildroot/build/output/beaglebone/buildroot/output/images/sdcard.img
     ```
  - **Image Installation**    
  
  
  
