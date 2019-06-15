# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "backup/map.jinja" import backup with context %}

backup_install__pkg:
  pkg.installed:
    - pkgs: {{ backup.pkgs | tojson }}

backup_install__dozbscript:
  file.managed:
    - name: {{ backup.dirprefix }}/{{ backup.bindir }}/{{ backup.dozbscript }}
    - source: salt://backup/files/dozb.jinja
    - template: jinja
    - context:
        backup: {{backup|json}}
    - mode: 755
    - user: root
    - group: root
