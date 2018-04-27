# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "backup/map.jinja" import backup with context %}

backup_jobs__backupscript:
  file.managed:
    - name: {{ backup.dirprefix }}/{{ backup.bindir }}/{{ backup.backupscript }}
    - source: salt://backup/files/backupscript.jinja
    - template: jinja
    - context:
      confdict: {{backup|json}}
    - mode: 755
    - user: root
    - group: root
