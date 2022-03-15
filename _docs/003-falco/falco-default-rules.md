- rule: Disallowed SSH Connection
  append: true
  enabled: false
  condition: and (never_true)
- rule: Unexpected outbound connection destination
  append: true
  enabled: false
  condition: and (never_true)
- rule: Unexpected inbound connection source
  append: true
  enabled: false
  condition: and (never_true)
- rule: Modify Shell Configuration File
  append: true
  enabled: false
  condition: and (never_true)
- rule: Read Shell Configuration File
  append: true
  enabled: false
  condition: and (never_true)
- rule: Schedule Cron Jobs
  append: true
  enabled: false
  condition: and (never_true)
- rule: Update Package Repository
  append: true
  enabled: false
  condition: and (never_true)
- rule: Write below binary dir
  append: true
  enabled: false
  condition: and (never_true)
- rule: Write below monitored dir
  append: true
  enabled: false
  condition: and (never_true)
- rule: Read ssh information
  append: true
  enabled: false
  condition: and (never_true)
- rule: Write below etc
  append: true
  enabled: false
  condition: and (never_true)
- rule: Write below root
  append: true
  enabled: false
  condition: and (never_true)
- rule: Read sensitive file trusted after startup
  append: true
  enabled: false
  condition: and (never_true)
- rule: Read sensitive file untrusted
  append: true
  enabled: false
  condition: and (never_true)
- rule: Write below rpm database
  append: true
  enabled: false
  condition: and (never_true)
- rule: DB program spawned process
  append: true
  enabled: false
  condition: and (never_true)
- rule: Modify binary dirs
  append: true
  enabled: false
  condition: and (never_true)
- rule: Mkdir binary dirs
  append: true
  enabled: false
  condition: and (never_true)
- rule: Change thread namespace
  append: true
  enabled: false
  condition: and (never_true)
- rule: Run shell untrusted
  append: true
  enabled: false
  condition: and (never_true)
- rule: Launch Privileged Container
  append: true
  enabled: false
  condition: and (never_true)
- rule: Launch Sensitive Mount Container
  append: true
  enabled: false
  condition: and (never_true)
- rule: Launch Disallowed Container
  append: true
  enabled: false
  condition: and (never_true)
- rule: System user interactive
  append: true
  enabled: false
  condition: and (never_true)
- rule: Terminal shell in container
  append: true
  enabled: false
  condition: and (never_true)
- rule: System procs network activity
  append: true
  enabled: false
  condition: and (never_true)
- rule: Program run with disallowed http proxy env
  append: true
  enabled: false
  condition: and (never_true)
- rule: Interpreted procs inbound network activity
  append: true
  enabled: false
  condition: and (never_true)
- rule: Interpreted procs outbound network activity
  append: true
  enabled: false
  condition: and (never_true)
- rule: Unexpected UDP Traffic
  append: true
  enabled: false
  condition: and (never_true)
# - rule: Ssh error in syslog
- rule: Non sudo setuid
  append: true
  enabled: false
  condition: and (never_true)
- rule: User mgmt binaries
  append: true
  enabled: false
  condition: and (never_true)
- rule: Create files below dev
  append: true
  enabled: false
  condition: and (never_true)
- rule: Contact EC2 Instance Metadata Service From Container
  append: true
  enabled: false
  condition: and (never_true)
- rule: Contact cloud metadata service from container
  append: true
  enabled: false
  condition: and (never_true)
- rule: Contact K8S API Server From Container
  append: true
  enabled: false
  condition: and (never_true)
- rule: Unexpected K8s NodePort Connection
  append: true
  enabled: false
  condition: and (never_true)
- rule: Launch Package Management Process in Container
  append: true
  enabled: false
  condition: and (never_true)
- rule: Netcat Remote Code Execution in Container
  append: true
  enabled: false
  condition: and (never_true)
- rule: Launch Suspicious Network Tool in Container
  append: true
  enabled: false
  condition: and (never_true)
- rule: Launch Suspicious Network Tool on Host
  append: true
  enabled: false
  condition: and (never_true)
- rule: Search Private Keys or Passwords
  append: true
  enabled: false
  condition: and (never_true)
- rule: Clear Log Activities
  append: true
  enabled: false
  condition: and (never_true)
- rule: Remove Bulk Data from Disk
  append: true
  enabled: false
  condition: and (never_true)
- rule: Delete or rename shell history
  append: true
  enabled: false
  condition: and (never_true)
- rule: Delete Bash History
  append: true
  enabled: false
  condition: and (never_true)
- rule: Set Setuid or Setgid bit
  append: true
  enabled: false
  condition: and (never_true)
- rule: Create Hidden Files or Directories
  append: true
  enabled: false
  condition: and (never_true)
- rule: Launch Remote File Copy Tools in Container
  append: true
  enabled: false
  condition: and (never_true)
- rule: Create Symlink Over Sensitive Files
  append: true
  enabled: false
  condition: and (never_true)
- rule: Create Hardlink Over Sensitive Files
  append: true
  enabled: false
  condition: and (never_true)
- rule: Detect outbound connections to common miner pool ports
  append: true
  enabled: false
  condition: and (never_true)
- rule: Detect crypto miners using the Stratum protocol
  append: true
  enabled: false
  condition: and (never_true)
- rule: The docker client is executed in a container
  append: true
  enabled: false
  condition: and (never_true)
- rule: Packet socket created in container
  append: true
  enabled: false
  condition: and (never_true)
- rule: Network Connection outside Local Subnet
  append: true
  enabled: false
  condition: and (never_true)
- rule: Outbound or Inbound Traffic not to Authorized Server Process and Port
  append: true
  enabled: false
  condition: and (never_true)
- rule: Redirect STDOUT/STDIN to Network Connection in Container
  append: true
  enabled: false
  condition: and (never_true)
- rule: Container Drift Detected (chmod)
  append: true
  enabled: false
  condition: and (never_true)
- rule: Container Drift Detected (open+create)
  append: true
  enabled: false
  condition: and (never_true)
- rule: Outbound Connection to C2 Servers
  append: true
  enabled: false
  condition: and (never_true)
- rule: Linux Kernel Module Injection Detected
  append: true
  enabled: false
  condition: and (never_true)
- rule: Container Run as Root User
  append: true
  enabled: false
  condition: and (never_true)
- rule: Sudo Potential Privilege Escalation
  append: true
  enabled: false
  condition: and (never_true)
- rule: Debugfs Launched in Privileged Container
  append: true
  enabled: false
  condition: and (never_true)
- rule: Mount Launched in Privileged Container
  append: true
  enabled: false
  condition: and (never_true)
- rule: Unprivileged Delegation of Page Faults Handling to a Userspace Process
  append: true
  enabled: false
  condition: and (never_true)
- rule: Launch Ingress Remote File Copy Tools in Container
  append: true
  enabled: false
  condition: and (never_true)
