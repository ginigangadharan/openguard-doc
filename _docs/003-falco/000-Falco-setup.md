# Falco configs

https://falco.org/docs/alerts/

## Installing Falco
https://falco.org/docs/getting-started/installation/


### Ubuntu

```shell
## Trust the falcosecurity GPG key, configure the apt repository, and update the package list:
curl -s https://falco.org/repo/falcosecurity-3672BA8F.asc | apt-key add -
echo "deb https://download.falco.org/packages/deb stable main" | tee -a /etc/apt/sources.list.d/falcosecurity.list
apt-get update -y

## Install kernel headers:
apt-get -y install linux-headers-$(uname -r)

##Install Falco:
apt-get install -y falco
```

### Fedora/RHEL/CentOS

```shell
rpm --import https://falco.org/repo/falcosecurity-3672BA8F.asc
curl -s -o /etc/yum.repos.d/falcosecurity.repo https://falco.org/repo/falcosecurity-rpm.repo

yum -y install kernel-devel-$(uname -r)
yum -y install falco
```

## Start Falco service

```shell
## start falco
systemctl start falco
systemctl status falco
```

## Uninstall Falco

```shell
apt-get remove falco      # debian
yum erase falco           # fedora
```


## Falco rules

https://falco.org/docs/rules/
https://securityhub.dev/falco-rules/file-integrity-monitoring
https://securityhub.dev/

- `/etc/falco/falco_rules.yaml` - default rule
- `/etc/falco/falco_rules.local.yaml` - local rule

```yaml
## /etc/falco/falco_rules.local.yaml


- rule: Detect File Permission or Ownership Change
  desc: detect file permission/ownership change
  condition: >
    spawned_process and proc.name in (chmod, chown) and proc.args contains "/tmp/"
  output: >
    File below a known directory has permission or ownership change (user=%user.name
    command=%proc.cmdline file=%fd.name parent=%proc.pname pcmdline=%proc.pcmdline gparent=%proc.aname[2])
  priority: WARNING
  tags: [filesystem]
```

### Rule Priorities

https://falco.org/docs/rules/#rule-priorities

Every Falco rule has a priority which indicates how serious a violation of the rule is. The priority is included in the message/JSON output/etc. Here are the available priorities:

EMERGENCY
ALERT
CRITICAL
ERROR
WARNING
NOTICE
INFORMATIONAL
DEBUG

https://falco.org/blog/falco-security-audit/

## Disable default rules

1. Add a tag 

`sed -i 's/tags: \[/tags: \[openguarddemo,/g' /etc/falco/falco_rules.yaml`

2. run Falco with skipping tags

`falco -T openguarddemo`

### Configure systemd to include tag

```shell
## find the file
systemctl cat falco
  --> /lib/systemd/system/falco.service

## update 
ExecStart=/usr/bin/falco -T openguarddemo --pidfile=/var/run/falco.pid
```
## Configure Falco Alerts

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

TPNAQA2A2GBO2DOQHWXC

## Disable json value in output
# When using json output, whether or not to include the "output" property
# itself (e.g. "File below a known binary directory opened for writing
# (user=root ....") in the json output.
#json_include_output_property: true
```
 


 https://sysdig.com/blog/fascinating-world-linux-system-calls/


## Deplying rules to new hosts

Automated deployment using Ansible. (using role `deploy-falco-rules`)

```shell
$ cd ansible_data/project
$ ansible-playbook deploy-falco-rules.yaml -e "NODES=nodes" -i hosts/deployments
```