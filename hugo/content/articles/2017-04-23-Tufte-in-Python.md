---
layout: post
title: "Tufte in Python"
date: 2017-04-23
image: /static/images/minimalBoxplot.png
thumbnail: /static/images/thumbnails/thumb.minimalLinePlotPython.png
categories: stats
tags:
- python
- R
- tufte
highlighter: rouge
---

## Motivation

I greatly admire [Edward Tufte](https://en.wikipedia.org/wiki/Edward_Tufte).

After running across [Tufte in R](/home/thom/site/wilsonify/wilsonify.github.io/_posts/2017-04-18-one-hundered-year-flood.md). I thought it would be a fun challenge to port the plots to python.

<!--more-->

# imports

I'm going to need some libraries.


```../
import numpy as np
import pandas as pd
from matplotlib import pyplot as plt
from matplotlib import ticker as mtick

#just to use R datasets
from rpy2.robjects.packages import importr
import rpy2.robjects as ro
import pandas.rpy.common as com
```

## Minimal line plot 
I've left the original R code in the comments.

```python
#x <- 1967:1977
x = np.arange(1967,1978)

#y <- c(0.5,1.8,4.6,5.3,5.3,5.7,5.4,5,5.5,6,5)
#axis(2, at=seq(1,6,1), label=sprintf("$%s", seq(300,400,20)), tick=F, las=2, family="serif")
y = np.array([300.00,323.63,374.54,387.27,387.27,394.54,389.09,381.81,390.91,400.00,381.82])

#pdf(width=10, height=6)
fig=plt.figure(figsize=(10,6))
ax=fig.add_subplot(111)

#plot(y ~ x, axes=F, xlab="", ylab="", pch=16, type="b")
ax.plot(x,y,c='k')
ax.scatter(x,y,c='k',marker='o')
ax.set(xlabel="",ylabel="")
for s in ['top','left','bottom','right']:
    ax.spines[s].set_visible(False)

#axis(1, at=x, label=x, tick=F, family="serif")
ax.set_xticks(x,)

#abline(h=6,lty=2)
#abline(h=5,lty=2)
ax.axhline(y=400,linestyle='dashed',c='k')
ax.axhline(y=380,linestyle='dashed',c='k')

#text(max(x), min(y)*2.5
#      ,"Per capita\nbudget expanditures\nin constant dollars"
#      , adj=1
#      ,family="serif")

ax.annotate(xy=(x.max(),y.min())
            ,s="Per capita\nbudget expanditures\nin constant dollars"
            ,family='serif'
            ,horizontalalignment='right')

#text(max(x), max(y)/1.08, labels="5%", family="serif")
ax.annotate(xy=(x.max(),y[-2:].mean())
            ,s="5%"
            ,family='serif')
           
#dev.off()
plt.show()
```

![]({{ site.baseurl }}/static/images/minimalLinePlotPython.png)


## Quartile-frame scatterplot 


{% highlight python %}

ro.r('data(mtcars)')
data = com.load_data('mtcars')

#x <- mtcars$wt
#y <- mtcars$mpg
#axis(1,at=summary(x),labels=round(summary(x),1), tick=F, family="serif")
#axis(2,at=summary(y),labels=round(summary(y),1), tick=F, las=2, family="serif")

x=data['wt']
y=data['mpg']
xSummary=x.quantile([0,0.25,0.5,0.75,1.0]).map(lambda x: round(x,1))
ySummary=y.quantile([0,0.25,0.5,0.75,1.0]).map(lambda x: round(x,1))

#plot(x, y, main="", axes=FALSE, pch=16, cex=0.8, family="serif",
fig=plt.figure(figsize=(10,6))
ax=fig.add_subplot(111)
ax.scatter(x,y,c='k')
for s in ['top','left','bottom','right']:
    ax.spines[s].set_visible(False)
    
#xlab="Car weight (lb/1000)", ylab="Miles per gallon of fuel")

ax.set(xlabel="Car weight (lb/1000)"
       ,ylabel="Miles per gallon of fuel"
      ,xticks=xSummary
      ,yticks=ySummary)

plt.show()
{% endhighlight %}


![]({{ site.baseurl }}/static/images/quartile-frameScatterplotPython.png)

## Dot-dash Plot


```python
ro.r('data(mtcars)')
data = pd.rpy.common.load_data('mtcars')

#x <- mtcars$wt
x=data['wt']

#y <- mtcars$mpg
y=data['mpg']

#axis(1,at=summary(x),labels=round(summary(x),1), tick=F, family="serif")
xSummary=x.quantile([0,0.25,0.5,0.75,1.0]).map(lambda x: round(x,1))

#axis(2,at=summary(y),labels=round(summary(y),1), tick=F, las=2, family="serif")
ySummary=y.quantile([0,0.25,0.5,0.75,1.0]).map(lambda x: round(x,1))

#plot(x, y, main="", axes=FALSE, pch=16, cex=0.8, family="serif",
fig=plt.figure(figsize=(10,6))
ax=fig.add_subplot(111)
ax.scatter(x,y,c='k')
for s in ['top','left','bottom','right']:
    ax.spines[s].set_visible(False)
    
#xlab="Car weight (lb/1000)", ylab="Miles per gallon of fuel")

ax.set(xlabel="Car weight (lb/1000)"
       ,ylabel="Miles per gallon of fuel")

ax.xaxis.set_major_locator(mtick.MaxNLocator(5))
ax.xaxis.set_minor_locator(mtick.FixedLocator(x))
ax.yaxis.set_major_locator(mtick.MaxNLocator(5))
ax.yaxis.set_minor_locator(mtick.FixedLocator(y))

ax.tick_params('both', length=15, width=0, which='major')
ax.tick_params('both', length=15, width=1, which='minor')

plt.show()
```

![]({{ site.baseurl }}/static/images/dash-dotPlot.png)


## Marginal Histogram Scatterplot

This one was a bit more difficult.

I gave up on replicating the exact axis in favor of a just getting a decent histogram on each axis.

```python


ro.r('data(faithful)')
data=com.load_data('faithful')

#x <- faithful$waiting
x=data['waiting']
#y <- faithful$eruptions
y=data['eruptions']

#plot(x, y, main="", axes=FALSE, pch=16, cex=0.8,
#     xlab="Time till next eruption (min)", ylab="Duration (sec)", 
#     xlim=c(min(x)/1.1, max(x)), ylim=c(min(y)/1.5, max(y)))
fig=plt.figure(figsize=(10,6))
yHist=fig.add_subplot(221)
scatter=fig.add_subplot(222)
xHist=fig.add_subplot(224)

#axis(2, tick=F, las=2)
#axisstripchart(faithful$waiting, 1)
yHist.hist(y,orientation='horizontal',color='k')
yHist.axis('off')
yHist.set(aspect=100
          ,xlim=yHist.get_xlim()[::-1] # invert x-axis
          ,anchor='E')

scatter.scatter(x,y,c='k')
scatter.set_anchor('W')
for s in scatter.spines.keys():
    scatter.spines[s].set_visible(False)

#axis(1, tick=F)
#axisstripchart(faithful$eruptions, 2)
xHist.hist(x,orientation='vertical',color='k')
xHist.axis('off')
xHist.set_aspect(0.1)
xHist.set_ylim(xHist.get_ylim()[::-1]) # invert y-axis
xHist.set_anchor('N')

plt.tight_layout(pad=0.5) #as tight as possible
plt.show()

```

![]({{ site.baseurl }}/static/images/marginalHistogramScatterplotPython.png)


## Minimal Boxplot

This was tougher than I thought it would be.
The R code doesn't line up well this time, so I removed it from the comments.

```python
#import data from R
ro.r('data(quakes)')
data=com.load_data('quakes')

#initialize the figure and axes/subplot
fig=plt.figure(figsize=(10,6)) 
ax=fig.add_subplot(111)

#use pandas boxplot. it's a little nicer than matplotlib's
bp=data.boxplot(column='stations'
             ,by='mag'
             ,ax=ax
             ,grid=False
             ,showfliers=False
             ,showbox=False
             ,showcaps=False
             ,widths=0.005
             ,return_type='dict')

#loop through wisker lines. could not get whiskerprops={'color':'k'} to work.
for w in bp['stations']['whiskers']:
    w.set_color('k')

#loop through medians to create markers
for m in bp['stations']['medians']:
    m.set_marker('o')
    m.set_markerfacecolor('k')
    m.set_markeredgecolor('k')
    m.set_markersize(3)

#turn off spines    
for s in ax.spines.keys():
    ax.spines[s].set_visible(False)

#set title
ax.set_title("Number of stations \nreporting Richter Magnitude\nof Fiji earthquakes (n=1000)")
plt.suptitle("") # remove pandas default title

plt.show()
```

![]({{ site.baseurl }}/static/images/minimalBoxplot.png)

## Minimal Bar Chart

```python
#import data
ro.r('library(psych)')
d=ro.r('colMeans(msq[,c(2,7,34,36,42,43,46,55,68)], na.rm = T)*10')
data=com.convert_robj(d) #data is a Series rather than DataFrame this time

#initialize the figure and axes/subplot
fig=plt.figure(figsize=(10,6)) 
ax=fig.add_subplot(111)

# use pandas bar plot
data.plot.bar(color = '0.75',width=0.4)

#overlay a white grid on the y-axis
ax.grid(axis='y',c='w')

#rotate the x axis tick labls
labels = ax.get_xticklabels()
plt.setp(labels, rotation=0, fontsize=10)

#turn off spines    
for s in ax.spines.keys():
    ax.spines[s].set_visible(False)

#set text on the figure in the top left 
ax.text(x=0
        ,y=data.max()
        ,va='top'
        ,s="""Average scores
non negative emotion traits
from 3896 participants
(Watson et al., 1988)""")
plt.show()

```

![]({{ site.baseurl }}/static/images/minimalBarChart.png)


