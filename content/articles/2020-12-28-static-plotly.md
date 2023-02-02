---
categories:
  - vizualization
date: 2020-12-28
tags:
  - data
  - vizualization
  - javascript
title: Plotly Example 
url: /2020/12/28/Plotly-Example/
---

# Plots

should see a plot here


{{< plots plot1 >}}
var trace1 = {
  x: [1, 2, 3, 4],
  y: [10, 15, 13, 17],
  type: 'scatter'
};

var trace2 = {
  x: [1, 2, 3, 4],
  y: [16, 5, 11, 9],
  type: 'scatter'
};

data = [trace1, trace2];
fig = {
  data: data
}
{{< /plots >}}


## Second Plot

and another here

{{< plots02 myDiv "{ \"x\":[1,2,3,4,5,6,7], \"y\":[2,4,6,8,16,32,64], \"z\":[2,4,6,16,16,30,50], \"status\":[1,1,1,0,0,1,1] }" >}}


