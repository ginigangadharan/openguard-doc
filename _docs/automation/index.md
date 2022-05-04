---
title: Security Automation
tags: 
 - ansible
 - automation
description: Security Automation
---

# Security Automation

Automated remediation for the incidents are managed using Ansible automation. The **OpenGuard Runner** is using [Ansible Runner](https://ansible-runner.readthedocs.io/en/stable/) in the backend to execute the playbooks and remediate issues based on rules in the OpenGuard Engine.

Ansible Playbooks are located inside the [ginigangadharan/openguard-runner](https://github.com/ginigangadharan/openguard-runner) repository and will be installed on Ansible Runner while you install and configure it.

