---
layout: default
title: "Projects"
navigation_weight: 3
---

{% for post in site.posts %}
  <article role="article">
  <header>
    <h2><a href="{{site.github.url}}{{post.url}}" rel="bookmark" title="Permanent Link to {{site.github.url}}{{post.url}}">{{post.title}}</a></h2>
    <time itemprop="dateCreated" datetime="{{post.date}}">{{ post.date | date: "%B %-d, %Y" }}</time>
  </header>
  <p>{{ post.excerpt | strip_html }} <a href="{{site.baseurl}}{{ post.url }}" class="more" title="read more">read more</a></p>
  </article>
  {% endfor %}
