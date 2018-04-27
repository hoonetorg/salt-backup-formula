# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "backup/map.jinja" import backup with context %}

backup_config__dozbconf:
  file.managed:
    - name: {{ backup.dirprefix }}/{{ backup.etcdir }}/{{ backup.dozbconf }}
    - source: salt://backup/files/dozb.conf.jinja
    - template: jinja
    - context:
      confdict: {{backup|json}}
    - mode: 644
    - user: root
    - group: root
