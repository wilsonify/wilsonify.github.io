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

{{/*% plots plot2 %*/}}
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
{{/*% /plots %*/}}