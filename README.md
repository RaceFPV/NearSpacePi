# NearSpacePi

A raspberry pi based weather balloon monitoring system built on ruby on rails

Hosted on the pi as its carried to 60,000ft+ for a stratospheric webserver!

FEATURING: Streaming of real time telemetry and video on a lightweight webpage

### Hardware

* Raspberry pi
* Raspberry pi camera
* GY-86 attitude meter
* DHT-11 humidity sensor
* DS18B20 temp sensor
* NEO-6M GPS
* RGB LED
* 2x 4.7k resistor

### Pinouts

* 5v for all components EXCEPT pull-ups
* 3.3v for pull-ups on temp sensor
* 4.7k resistor for external temp sensor
* 4.7k resistor for humidity sensor
* GPIO 2, GPIO 3 -- MPU6050
* GPIO 4 --external temp sensor
* GPIO 7 --humidity sensor
* GPIO 14, GPIO 15 -- NEO-6M GPS
* GPIO 9, GPIO 10, GPIO 11 -- RGB LED

* Schematic: http://i.imgur.com/Q8LdvWs.jpg

### Notes

* image file types supported: .png
* assuming default directory for pi camera images is 'streamed_images'
