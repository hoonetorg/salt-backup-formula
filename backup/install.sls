# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "backup/map.jinja" import backup with context %}

backup_install__pkg:
  pkg.installed:
    - pkgs: {{ backup.pkgs | tojson }}

{% set borg_source_hash = salt['cmd.shell']('echo "md5=`curl -L -s "' + backup.borgurl + '" | md5sum | cut -c -32`"') %}

backup_install__single_binary:
  file.managed:
    - name: /usr/bin/borg-standalone
    - source: {{ backup.borgurl }}
    - source_hash: {{ borg_source_hash }}
    - mode: '0755'
    - user: root
    - group: root

backup_install__single_binary_wrapper:
  file.managed:
    - name: /usr/bin/borg
    - contents: |
        #!/bin/bash
        export TEMP=/borgtemp
        mkdir -p $TEMP
        borg-standalone $@
    - mode: '0755'
    - user: root
    - group: root

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
