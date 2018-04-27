# -*- coding: utf-8 -*-
# vim: ft=sls

include:
  - backup.install
  - backup.config
  - backup.service

extend:
  backup_config__conffile:
    file:
      - require:
        - pkg: backup_install__pkg
  backup_service__service:
    service:
      - watch:
        - file: backup_config__conffile
      - require:
        - pkg: backup_install__pkg

