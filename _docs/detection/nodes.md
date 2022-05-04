---
title: Node configuration
tags:
 - client
 - nodes
description: Node configuration
---

# Node configuration

## Intaling Falco

Refer to [Falco installation](https://falco.org/docs/getting-started/installation/) documentations for details.


```shell
## Fedora
sudo rpm --import https://falco.org/repo/falcosecurity-3672BA8F.asc
sudo curl -s -o /etc/yum.repos.d/falcosecurity.repo https://falco.org/repo/falcosecurity-rpm.repo

## Install kernel headers:
sudo yum -y install kernel-devel-$(uname -r)

## Install Falco:
sudo yum -y install falco
```

## Start Falco service

```shell
## start falco
systemctl start falco
systemctl status falco
```

## Configure Falco Alerts

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

## Deplying rules to new hosts

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

### Automated deployment using Ansible

(using role `deploy-falco-rules`)

```shell
$ git clone https://github.com/ginigangadharan/openguard-runner
$ cd ansible_data/project
$ ansible-playbook deploy-falco-rules.yaml -e "NODES=nodes" -i hosts/deployments
```

## Uninstall Falco

```shell
apt-get remove falco      # debian
yum erase falco           # fedora
```
