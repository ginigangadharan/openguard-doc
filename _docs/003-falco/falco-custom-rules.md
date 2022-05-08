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
```

## Custom rules for OpenGuard

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