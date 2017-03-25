---
layout: default
---

{% for local_variable in local_variables %}
  {{ local_variable }}
  {{ local_variable | jsonify }}
{% endfor %}

{{ site | debug }}
