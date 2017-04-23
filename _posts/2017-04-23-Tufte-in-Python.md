---
layout: post
title: "Tufte in Python"
date: 2017-04-23
image: /assets/images/minimalLinePlotPython.png
thumbnail: /assets/images/thumbnails/thumb.minimalLinePlotPython.png
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

![]({{ site.baseurl }}/assets/images/minimalLinePlotPython.png)


## Quartile-frame scatterplot 


{% highlight python linenos %}

import numpy as np
from matplotlib import pyplot as plt
from matplotlib import ticker as mtick
from rpy2.robjects.packages import importr
import rpy2.robjects as ro
import pandas.rpy.common as com

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


![]({{ site.baseurl }}/assets/images/quartile-frameScatterplotPython.png)

## Dot-dash Plot


```python
import numpy as np
from matplotlib import pyplot as plt
from matplotlib import ticker as mtick
from rpy2.robjects.packages import importr
import rpy2.robjects as ro
import pandas as pd

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

![]({{ site.baseurl }}/assets/images/dash-dotPlot.png)


## Marginal Histogram Scatterplot

This one was a bit more difficult.

I gave up on replicating the exact axis in favor of a just getting a decent histogram on each axis.

```python
import numpy as np
from matplotlib import pyplot as plt
from matplotlib import ticker as mtick
import pandas as pd

#just to use R datasets
from rpy2.robjects.packages import importr
import rpy2.robjects as ro
import pandas.rpy.common as com

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

![]({{ site.baseurl }}/assets/images/marginalHistogramScatterplotPython.png)



