---
layout: default
---

{{ site.github | inspect }}

{% for var in global_variables %}
    {{ var }}
    {{ var | inspect }}
{% endfor %}

{% for var in local_variables %}
    {{ var }}
    {{ var | inspect }}
{% endfor %}
