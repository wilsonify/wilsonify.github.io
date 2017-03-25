---
layout: default
title: debug
tagline: inspect all the things
---

# site.github
"{{ site.github | jsonify }}"

# site
{% for var in site %}
## {{var}}
{{ var | jsonify }}
{% endfor %}

# page
{% for var in page %}
## {{var}}
{{ var | jsonify }}
{% endfor %}


# Paginator
"{{ paginator | jsonify }}"
