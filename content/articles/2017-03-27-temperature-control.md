---
categories:
  - projects
date: 2017-03-27 12:02:00+00:00
exerpt_separator: <!--more-->
image: /images/smokepoint.png
tags:
  - cooking
  - arduino
thumbnail: /images/thumbnails/thumb.smokepoint.png
title: Temperature Control
url: /2017/03/27/temperature-control/
---



Problem: stovetop temperature is poorly controlled resulting in inconsistent cooking times and results.

Solution: Use an Arduino to control the temperature of pan.

<!--more-->

![](/images/thermocouple.jpg) 
I started by purchasing a k-type thermocouple from amazon (about $5). I also needed some female connections to connect to my circuit.

The thermo couple is composed of two wires, each a different alloy of chrome.

![](/images/Thermocouple_circuit_Ktype_including_voltmeter_temperature.png)
Any temperature difference between the ends will create a current in the wire. I should be able to measure the current with my arduino and hopefully use that signal to control the temperature of my pan.

&nbsp;

My plan is to control the temperature just below the smoke point of what every oil is being used.
![](/images/smokepoint.png)

&nbsp;

Since the termocouple output will be just a few millivolts. I will need to amplify the signal closer to the 5mV range for the arduino to record it properly.


