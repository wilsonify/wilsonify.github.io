---
layout: default
---

{{ site.github | inspect }}

# Global Variables
{% for var in global_variables %}
    {{ var }}
    {{ var | inspect }}
{% endfor %}

# Local Variables
{% for var in local_variables %}
    {{ var }}
    {{ var | inspect }}
{% endfor %}
