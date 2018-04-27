# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "backup/map.jinja" import backup with context %}

backup_install__pkg:
  pkg.installed:
    - pkgs: {{ backup.pkgs }}
