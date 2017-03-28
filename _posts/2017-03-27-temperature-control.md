---
layout: post
title: Temperature Control
date: 2017-03-27T12:02:00Z
image: /assets/images/smokepoint.png
categories: projects
tags:
- cooking
- arduino
exerpt_separator: <!--more-->
---


Problem: stovetop temperature is poorly controlled resulting in inconsistent cooking times and results.

Solution: Use an Arduino to control the temperature of pan.

<!--more-->

![]({{site.baseurl}}/assets/images/thermocouple.jpg) 
I started by purchasing a k-type thermocouple from amazon (about $5). I also needed some female connections to connect to my circuit.

The thermo couple is composed of two wires, each a different alloy of chrome.

![]({{site.baseurl}}/assets/images/Thermocouple_circuit_Ktype_including_voltmeter_temperature.png)
Any temperature difference between the ends will create a current in the wire. I should be able to measure the current with my arduino and hopefully use that signal to control the temperature of my pan.

&nbsp;

My plan is to control the temperature just below the smoke point of what every oil is being used.
![]({{site.baseurl}}/assets/images/smokepoint.png)

&nbsp;
