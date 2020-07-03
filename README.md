# Raspicam



Get an IP camera with a Raspberry PI.

This project will generate a minimal Buster Raspbian image and include a RTSP server to stream video in H.264.



# Used software

pi-gen: https://github.com/RPi-Distro/pi-gen *Tool used to create the raspberrypi.org Raspbian images*

v4l2rtspserver:  https://github.com/mpromonet/v4l2rtspserver



# Included in the image

apache web server

motion



# Inspired by



https://github.com/florian-asche/RaspberryPiStreamingCamera

https://github.com/ronnyvdbr/RaspberryIPCamera



# Build your image

check README.pi-gen

- install docker

- edit config file with your settings (check config.example)

-  ./build-docker.sh -c config

- Raspbian image will be in "deploy" directory.



Install the raspbian image on your SDcard and start the raspberry.

Connect to:

```
rtsp://<PI-IP-ADDRESS>:8554
```