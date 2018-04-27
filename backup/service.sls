# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "backup/map.jinja" import backup with context %}

backup_service__service:
  service.{{ backup.service.state }}:
    - name: {{ backup.service.name }}
{% if backup.service.state in [ 'running', 'dead' ] %}
    - enable: {{ backup.service.enable }}
{% endif %}

