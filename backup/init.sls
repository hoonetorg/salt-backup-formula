# -*- coding: utf-8 -*-
# vim: ft=sls

include:
  - backup.install
  - backup.config
  - backup.jobs
  #- backup.service

extend:
  backup_config__dozbconf:
    file:
      - require:
        - pkg: backup_install__pkg
        - file: backup_install__dozbscript

  backup_jobs__backupscript:
    file:
      - require:
        - file: backup_config__dozbconf
        - pkg: backup_install__pkg
        - file: backup_install__dozbscript

  
  #backup_service__service:
  #  service:
  #    - watch:
  #      - file: backup_config__dozbconf
  #    - require:
  #      - pkg: backup_install__pkg
  #      - file: backup_install__dozbscript

