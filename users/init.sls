{% from "users/map.jinja" import users with context %}

{% for name, user in pillar.get('users', {}).items() %}
{{ name }}:
  user.present:
    - fullname: {{ user['fullname'] }}
    {% if 'home' in user -%}
    - home: {{ user['home'] }}
    {% else %}
    - home: /home/{{ name }}
    {% endif %}
    {% if 'uid' in user -%}
    - uid: {{ user['uid'] }}
    {% endif -%}
    {% if 'gid' in user -%}
    - gid: {{ user['gid'] }}
    {% endif -%}
    - groups:
      {% for group in user.get('groups', []) -%}
      - {{ group }}
      {% endfor %}

{% if 'sudouser' in user %}
/etc/sudoers.d/{{ name }}:
  file.managed:
  - source: salt://users/templates/sudoers.d.jinja2
  - template: jinja
  - context:
    user_name: {{ name }}
{% endif %}

{% if 'ssh_auth' in user %}
sshkey_{{ name }}:
  ssh_auth.present:
    - user: {{ name }}
    - source: {{ user['ssh_auth'] }}
{% endif %}
{% endfor %}

{% for rmuser in pillar.get('absent_users', []) %}
user_remove_{{ rmuser }}:
  user.absent:
    - name: {{ rmuser }}
    - purge: True
{% endfor %}
