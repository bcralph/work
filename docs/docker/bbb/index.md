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
  - **Install Image**    
    - Windows / macOS: 
      - Application Recommended: balenaEtcher    
    - Linux: 
      - 'dd' command to write image into SD card.    
      ```
      dd if=sdcard.img of=/dev/sdx bs=1M 
      # sdx is sdcard reader device, maybe different in your system.  
      # after done, you can run 'sync' command for safe. 
      ```
  
  - **Boot**     
    - TI Beaglebone default boot sequence won't use SD card, so you have to press     
      the button behind the SD card slot before you power on. Wait for 1 second     
      after power on, release the button.     
    - Console login: root (no password)    

    - Adafruit 4 Pin Cable (PL2303)

      | **Board**    |  **cable**  |
      |:------------:|:-----------:|
      | Pin 1 (GND)  | Black (GND) |
      | Pin 4 (RX)   | Green (TX)  |
      | Pin 5 (TX)   | White (RX)  |

    - The boot up at first time will create partition for Docker and Node-RED.     
      After done, the system will reboot again, and you can see the message on     
      the console.     

  - **Node-RED**  
    - There are some scripts for set up Node-RED in Docker, please follow the steps    
      listed below.    
      
      **Build Node-red Docker Image**
      ```
      # cd /etc/test/node-red
      # ./build.sh
      ```   
      This will follow the 'Dockerfile' to build docker image.    
          
      *(Wait for a while for docker to build image...)*    
          
      **Create Docker Container**    
      ```
      # ./run.sh 
      ```    
      This will run in interactive mode, so it will enter the terminal of the container.     
      This step only run at the first time, and you just need to run 'start.sh' after this.     
      **Start Continaer**
      ```
      $ ./start.sh
      ```    
    - Run Node-RED in Docker    
      ```
      root@node-red:/work/share/node-red# node-red -s ./node-red-settings.js -u /work/share/node-red
      ```    
      TI Beaglebone Black DHCP is enabled, please connect you Ethernet port to intranet.   
      If you check your gateway or server, and you can access Node-RED by browser with 
      the link example as below.     
      **Notes:** DDNS will be a option for user to access the device, otherwise, need     
      other machanism, i.e. UPnP or http scan, etc.     
      Link ex:    
      ```
      http://192.168.2.165:1880
      ```    
      Login page    
      
      ![Node-RED Login](https://raw.githubusercontent.com/bcralph/work/master/docs/docker/bbb/node-red-login.png){:width="100px"}    

      



