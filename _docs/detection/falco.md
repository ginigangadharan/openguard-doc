---
title: Falco configuration
tags:
 - falco, installation
description: Falco configuration
---
# Falco configuration

## Instaling Falco

Refer to [Falco installation](https://falco.org/docs/getting-started/installation/) documentations for details.


```shell
$ sudo rpm --import https://falco.org/repo/falcosecurity-3672BA8F.asc
$ sudo curl -s -o /etc/yum.repos.d/falcosecurity.repo https://falco.org/repo/falcosecurity-rpm.repo

## Install kernel headers:
$ sudo yum -y install kernel-devel-$(uname -r)

## Install Falco:
$ sudo yum -y install falco
```

## Start Falco service

```shell
## start falco
$ sudo systemctl start falco
$ sudo systemctl status falco
```

## Configure Falco Alerts

Check [Falco Alerts](https://falco.org/docs/alerts/) for details.

Falco configuration is located at `/etc/falco/falco.yaml`.

- Token value need to get from OpenGuard GUI. Refer to [Generating Token](/docs/openguard/token) for more details.

```yaml
## /etc/falco/falco.yaml

## configure http_output to openguard api
http_output:
  enabled: True
  url: http://192.168.56.1:8000/api/incident_report/?source_hostname=Ubuntu-20-CP&token=TPNAQA2A2GBO2DOQHWXC
  user_agent: "falcosecurity/falco"
## configure json_output
# Whether to output events in json or text
json_output: true
```

## Deploying rules to new hosts

Falco rules are located in following files.

- `/etc/falco/falco_rules.yaml` - default rule
- `/etc/falco/falco_rules.local.yaml` - local rule

Instead of editing the default rule, custom rules can be added in local rule file - `/etc/falco/falco_rules.local.yaml`

Sample rule for detecting `/tmp` permission changes

```yaml
## /etc/falco/falco_rules.local.yaml

## /tmp permission
- rule: FALCO_OGRULE_DIR_TMP
  desc: Detect File Permission or Ownership Change for tmp directory
  condition: >
    spawned_process and proc.name in (chmod, chown) and proc.args contains "/tmp/"
  output: >
    Permission or ownership changed for /tmp (user=%user.name
    command=%proc.cmdline file=%fd.name parent=%proc.pname pcmdline=%proc.pcmdline gparent=%proc.aname[2])
  priority: CRITICAL
  tags: [filesystem]
```

Refer to [Rules section](https://falco.org/docs/rules/) and [Supported Fields for Conditions and Outputs](https://falco.org/docs/rules/supported-fields/) for creating rules.

## Falco Custom rules for OpenGuard

```yaml
- list: etc_motd_filenames
  items: [/etc/motd]

- list: etc_logindefs_filenames
  items: [/etc/login.defs]

## /tmp permission
- rule: FALCO_OGRULE_DIR_TMP
  desc: Detect File Permission or Ownership Change for tmp directory
  condition: >
    spawned_process and proc.name in (chmod, chown) and proc.args contains "/tmp/"
  output: >
    Permission or ownership changed for /tmp (user=%user.name
    command=%proc.cmdline file=%fd.name parent=%proc.pname pcmdline=%proc.pcmdline gparent=%proc.aname[2])
  priority: CRITICAL
  tags: [filesystem]

## /root permission
- rule: FALCO_OGRULE_DIR_ROOT
  desc: Detect File Permission or Ownership Change for /root directory
  condition: >
    spawned_process and proc.name in (chmod, chown) and proc.args contains "/root"
  output: >
    Permission or ownership changed for /root (user=%user.name
    command=%proc.cmdline file=%fd.name parent=%proc.pname pcmdline=%proc.pcmdline gparent=%proc.aname[2])
  priority: CRITICAL
  tags: [filesystem]

## /etc/password permission
- rule: FALCO_OGRULE_ETC_PASSWORD
  desc: Detect File Permission or Ownership Change for /etc/password file
  condition: >
    spawned_process and proc.name in (chmod, chown) and proc.args contains "/etc/passwd"
  output: >
    Permission or ownership changed for /etc/password (user=%user.name
    command=%proc.cmdline file=%fd.name parent=%proc.pname pcmdline=%proc.pcmdline gparent=%proc.aname[2])
  priority: CRITICAL
  tags: [permission]

## /etc/shadow permission
- rule: FALCO_OGRULE_ETC_SHADOW
  desc: Detect File Permission or Ownership Change for /etc/shadow file
  condition: >
    spawned_process and proc.name in (chmod, chown) and proc.args contains "/etc/shadow"
  output: >
    Permission or ownership changed for /etc/password (user=%user.name
    command=%proc.cmdline file=%fd.name parent=%proc.pname pcmdline=%proc.pcmdline gparent=%proc.aname[2])
  priority: CRITICAL
  tags: [permission]

## /etc/group permission
- rule: FALCO_OGRULE_ETC_GROUP
  desc: Detect File Permission or Ownership Change for /etc/group file
  condition: >
    spawned_process and proc.name in (chmod, chown) and proc.args contains "/etc/group"
  output: >
    Permission or ownership changed for /etc/password (user=%user.name
    command=%proc.cmdline file=%fd.name parent=%proc.pname pcmdline=%proc.pcmdline gparent=%proc.aname[2])
  priority: CRITICAL
  tags: [permission]

## /etc/motd change
- rule: FALCO_OGRULE_FILE_ETC_MOTD_CHANGE
  desc: Detect attempt to modify /etc/motd file
  condition: evt.type in (open,openat,openat2) and evt.is_open_write=true and fd.typechar='f' and fd.num>=0 and fd.name in (etc_motd_filenames)
  output: >
    The /etc/motd file has been modified (user=%user.name user_loginuid=%user.loginuid command=%proc.cmdline pcmdline=%proc.pcmdline file=%fd.name container_id=%container.id)
  priority: CRITICAL
  tags: [filesystem]

## /etc/login.defs change
- rule: FALCO_OGRULE_FILE_ETC_LOGIN_DEF_CHANGE
  desc: Detect attempt to modify /etc/login.defs file
  condition: evt.type in (open,openat,openat2) and evt.is_open_write=true and fd.typechar='f' and fd.num>=0 and fd.name in (etc_logindefs_filenames)
  output: >
    The /etc/motd file has been modified (user=%user.name user_loginuid=%user.loginuid command=%proc.cmdline pcmdline=%proc.pcmdline file=%fd.name container_id=%container.id)
  priority: CRITICAL
  tags: [filesystem]
```

### Automated Falco Rules deployment using Ansible

(using role `deploy-falco-rules`)

Instead of configuring the rules manually, existing playbook can be used to deploy Falco rules as follows.

```shell
$ git clone https://github.com/ginigangadharan/openguard-runner
$ cd ansible_data/project
$ ansible-playbook deploy-falco-rules.yaml -e "NODES=nodes" -i hosts/deployments
```

## Uninstall Falco

```shell
$ apt-get remove falco      # debian
$ yum erase falco           # fedora
```

## Rule Priorities

Every Falco rule has a priority which indicates how serious a violation of the rule is. The priority is included in the message/JSON output/etc. Here are the available priorities:

- EMERGENCY
- ALERT
- CRITICAL
- ERROR
- WARNING
- NOTICE
- INFORMATIONAL
- DEBUG

## Disable default Falco rules

Step 1. Add a tag `openguarddemo`

`sed -i 's/tags: \[/tags: \[openguarddemo,/g' /etc/falco/falco_rules.yaml`

Step 2. run Falco with skipping tags

`falco -T openguarddemo`

## Configure systemd to include tag

```shell
## find the file
systemctl cat falco
  --> /lib/systemd/system/falco.service

## update 
ExecStart=/usr/bin/falco -T openguarddemo --pidfile=/var/run/falco.pid
```

## Resources

- [Rule Priorities](https://falco.org/docs/rules/#rule-priorities)
- [Falco Security Audit](https://falco.org/blog/falco-security-audit/)