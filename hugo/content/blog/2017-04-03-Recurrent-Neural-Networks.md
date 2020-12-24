---
layout: post
image: /static/images/RNN.png
thumbnail: /static/images/thumbnails/thumb.RNN.png
title: Recurrent Neural Network
date: 2017-04-03
categories: "MachineLearning"
tags:
- music
- tensorflow
exerpt_separator: <!--more-->
use_math: true
---

After watching this [presentation](https://www.youtube.com/watch?v=vq2nnJ4g6N0), where Martin Görner shows the use of 
recurrent neural networks to create a new Shakespear play, I was feeling inspired.
So, I pointed his code a bunch of song lyrics.

# Background
I've been interested in Neural Networks for a long time because, fundamentally, they are similar to a procress controller.

$$ Output = Input \times Weight + Bias $$

It's just a line. For multiple inputs/outputs, the equation is the same, but the are matrices (or tensors). Why stop there, send the output of one "neuron" to the input of another and you've got a "deep" network.

# A "recurrent" network is
>a neural network where the output of one neuron is appended to the original input and passed to the next neuron. 

They work remarkably well for language processing (think google translate).

# Getting the lyrics
First, I used the [Genius API](https://docs.genius.com/) to find lyrics for as many Beatles songs as possible. You can see my code on [github](https://github.com/wilsonify/lyrics)

# Tensorflow
Next, I installed google's [Tensorflow](https://www.tensorflow.org/install/).

# Training
I then got to work training my neural network to predict Beatles song lyrics.

# Result
I think it's beautiful. My network is far from optimal, but the fact that it outputs anything that resembles a song lyric in english is amazing.


>Title:I'm Down
>
[Verse 1]
I seed to lose her alone
Well I know I'm gone you live be anymore
I know I'll never be the same
If I don't get her back again
>
[Verse 2]
I can tell you baby what you weal in the short
In our love you made me take
I want you so bad It's not to be back
I'm so glad you walk in your door
I never get you in so my eight 
>
Now give me money
That's what I want
That's what I want



>Title:That Goes On Girl
>
[Chorus]
Hol' up. Don't you know it's gonna be alright
Alright, alright
>
[Verse 1]
And you want it, any time you use it
Out you got the wall
I'm a bog the boat as you want to do
As go and is not something
Things you bet eeery to say
It's today just things are going
They're gonna pain at you dest
>
[Bridge]
I feel as tough you ought to know
That I've been good, as good as I can be
Then I could you like no time
I won't get it just to hear, you know
won't you please, don't you stop le Girl
