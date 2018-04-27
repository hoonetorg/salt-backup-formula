# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "backup/map.jinja" import backup with context %}

/tmp/backup.yaml:
  file.managed:
    - contents: |
        {{backup|yaml(False)|indent(8)}}
