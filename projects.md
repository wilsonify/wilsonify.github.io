---
layout: default
title: "Projects"
navigation_weight: 3
---

{% for p in site.posts %}
 {% for c in p.categories %}
  {% if c=="projects" %}
# [{{p.title}}]({{site.baseurl}}{{ p.url }})
{{ p.tagline }}
{{ p.exerpt }}
  {% endif %}
 {% endfor %}
{% endfor %}
