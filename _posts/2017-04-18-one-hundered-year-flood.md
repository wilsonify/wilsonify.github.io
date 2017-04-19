---
layout: post
title: "100 Year Flood"
date: 2017-04-18
image: /assets/images//BraysBayouFlow.png
thumbnail: /assets/images/thumbnails/thumb.BraysBayouHeight.png
categories: stats
tags:
- bayou
- normal
---

## Definition

100-year flood, means that the [Annual Exceedance Probability](https://en.wikipedia.org/wiki/Frequency_of_exceedance) is 1/100.

It is is a strange term. I cannot think of any other probability that is expressed in this way.
In any case, I want to calculate the 100-year flood plain for my area.

<!--more-->

First, I need some historical data. Luckily, the [USGS](https://nwis.waterdata.usgs.gov/nwis/peak?site_no=08075110&agency_cd=USGS&format=html) has the annual peak flow data available online.


## Height

First I tried to directly fit the height data to a normal distribution. This is almost good enough, but notice the change-point between 2002-2007. I confirmed that there was [major construction](https://www.projectbrays.org/about-project-brays/project-history/) done in that time frame.


> In 2005, channel modifications began on a three-mile upstream channel segment between Old Westheimer Road and Highway 6 and construction is now complete. Construction began on the first downstream channel segment, from the mouth of Brays Bayou to Lawndale, in the first quarter of 2006. In the second quarter of 2006, construction began on the second downstream channel segment, from the mouth to Lawndale.

![]({{site.baseurl}}/assets/images/BraysBayouHeight.png)

Technically, floods are defined by volume flow-rate, so let's be more precise.


## Volumetric Flow
Using the same data source, I fit the volume flow rate to a normal distribution. 
This time it looks more normal across time.

![]({{site.baseurl}}/assets/images//BraysBayouFlow.png)



## Solve for Height

Volume flow is proportional to the cross sectional area of the bayou.
Each cross section of the bayou is a trapezoid. 

$$ Area_{trapezoid} = \frac{(b_1 + b_2)h}{2} $$

$$ b_2   = b_1 + 2x $$

$$ \frac{h}{x}  = tan(\theta) $$


![]({{site.baseurl}}/assets/images/crossSection.png)

If follows that height vs flow fits quadratically.

![]({{site.baseurl}}/assets/images/BraysBayouHeightvsFlow.png)

My original approach (55ft) was quite accurate for data prior to 2005.

The current 100-year flood mark is much lower at 46ft.

## In Action

This is a slightly different part of the bayou. Data is from Harris County rather than USGS.

![]({{ site.baseurl }}/assets/images/crisisAverted.jpg)

view my [notebook](https://github.com/wilsonify/flood/blob/master/flood.ipynb)



