# NearSpacePi

A raspberry pi based weather balloon monitoring system built on ruby on rails

Hosted on the pi as its carried to 60,000ft+ for a stratospheric webserver!

FEATURING: Streaming of real time telemetry and video on a lightweight webpage

### Hardware

* Raspberry pi
* Raspberry pi camera
* GY-86 attitude meter
* Temp sensor
* Humidity sensor
* NEO-6M GPS

### Pinouts

* 5v for all components
* GPIO 2, GPIO 3 -- MPU6050
* GPIO 14, GPIO 15 -- NEO-6M GPS
* GPIO 7 -- External temp sensor
* GPIO 7 -- Humidity sensor
* GPIO 9, GPIO 10, GPIO 11 -- RGB LED