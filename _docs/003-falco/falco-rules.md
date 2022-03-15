# Falco Custom Rules

```yaml
## Sample - DONOT use
- rule: Detect File Permission or Ownership Change for tmp directory
  desc: detect file permission/ownership change
  condition: >
    spawned_process and proc.name in (chmod, chown) and proc.args contains "/tmp/"
  output: >
    Permission or ownership changed for /tmp (user=%user.name
    command=%proc.cmdline file=%fd.name parent=%proc.pname pcmdline=%proc.pcmdline gparent=%proc.aname[2])
  priority: WARNING
  tags: [filesystem]


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