
0. Before you follow the information as below, please refer to the 
   insturctions and basic knowledge for 'docker'. 

1. The repository is from 'brainchildralph/work:bbb', and container name 
   is 'bbb'. These configurations are under file which name is 
   'config'. 

   The content of 'config' is like 

     name=bbb  
     repo=brainchildralph/work:bbb

2. Please follow the steps as below to run docker.     

   - ./run.sh  - Download image 'brainchildralph/work:bbb' and     
      create container named 'bbb'. 
   
   - ./start.sh - Start the container. It won't run under     
     'interactive' mode, but you can modify 'start.sh' with '-i'    
     flag. 

   - ./bash.sh - It will execute 'bash' for container with interactive
     mode.  

   - ./share - This folder is shared with container. 

   - The 'rm.sh' will remove the container but not image. Before you    
     remove the container, please run 'stop.sh' to make sure the     
     container is not running. If you want to clean image also, run     
     script 'rmi.sh'.


