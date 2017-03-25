---
layout: default
title: debug
tagline: inspect all the things
---

# site.github
"{{ site.github | jsonify }}"

# site
{{ site | jsonify }}

# page
{{ page | jsonify }}

# Paginator
"{{ paginator | jsonify }}"
