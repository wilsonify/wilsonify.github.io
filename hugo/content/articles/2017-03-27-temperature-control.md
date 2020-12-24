---
layout: post
title: Temperature Control
date: 2017-03-27T12:02:00Z
image: /static/images/smokepoint.png
thumbnail: /static/images/thumbnails/thumb.smokepoint.png

categories: projects
tags:
- cooking
- arduino
exerpt_separator: <!--more-->
---


Problem: stovetop temperature is poorly controlled resulting in inconsistent cooking times and results.

Solution: Use an Arduino to control the temperature of pan.

<!--more-->

![]({{site.baseurl}}/static/images/thermocouple.jpg) 
I started by purchasing a k-type thermocouple from amazon (about $5). I also needed some female connections to connect to my circuit.

The thermo couple is composed of two wires, each a different alloy of chrome.

![]({{site.baseurl}}/static/images/Thermocouple_circuit_Ktype_including_voltmeter_temperature.png)
Any temperature difference between the ends will create a current in the wire. I should be able to measure the current with my arduino and hopefully use that signal to control the temperature of my pan.

&nbsp;

My plan is to control the temperature just below the smoke point of what every oil is being used.
![]({{site.baseurl}}/static/images/smokepoint.png)

&nbsp;

Since the termocouple output will be just a few millivolts. I will need to amplify the signal closer to the 5mV range for the arduino to record it properly.



