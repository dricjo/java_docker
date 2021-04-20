#!/bin/sh

# native-image -jar ./app.jar -H:Name=output
mkdir result
mkdir build

docker run -it 
  -v HOST_CLASSPATH_DIRECTORY:build 
  -v HOST_RESULT_DIRECTORY:result 
  graal-native-image 
  "--static"
  "-H:Name=output" 
  "MAIN_CLASS"
