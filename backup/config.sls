# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "backup/map.jinja" import backup with context %}

backup_config__conffile:
  file.managed:
    - name: {{ backup.conffile }}
    - source: salt://backup/files/configtempl.jinja
    - template: jinja
    - context:
      confdict: {{backup|json}}
    - mode: 644
    - user: root
    - group: root
