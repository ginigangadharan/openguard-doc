---
title: Ansible Practice Workshops
tags:
 - ansible
 - automation
 - ansible automation platform
description: Workshops and hands on tasks for learning Ansible
---

# Ansible Practice Workshops

Learn Ansible by doing; we have a [30 Days of Ansible](https://github.com/ginigangadharan/30-Days-of-Ansible-Bootcamp) challenge by which you can watch the video and do hands-on  from your own lab setup. The playlist contains videos to prepare your own lab using Vagrant, VirtualBox or using Public Cloud such as AWS or GCP). 

Also check [Ansible](https://www.techbeatly.com/ansible/) guides to learn the core concepts.

## Create Ansible Lab

- [Build lab for practicing Ansible](https://youtu.be/6sulABLjEJM)
- [How to create a free Ansible lab in public cloud](https://youtu.be/eHj2NATil5M)
- [Use Terraform to create a free Ansible lab in AWS](https://youtu.be/JTIcTGU2JGY)

## Learn Ansible Concepts

We have a [free course](http://techbeatly.com/ansible-course) to learn Ansible and you can [watch](http://techbeatly.com/ansible-course) it at your own free time. All the playbooks and configurations are found in this [GitHub Repo](https://github.com/ginigangadharan/30-Days-of-Ansible-Bootcamp).

- If you are looking for other courses, check portals such as Udemy or KodeKloud.
- If you are planning for Ansible certification [RHCE (EX294 - Ansible)](https://www.redhat.com/en/services/training/ex294-red-hat-certified-engineer-rhce-exam-red-hat-enterprise-linux-8), then it is highly recommended to attend Red Hat course [RH294](https://www.redhat.com/en/services/training/rh294-red-hat-linux-automation-with-ansible) and [DO447 - Advanced Automation: Ansible Best Practices](https://www.redhat.com/en/services/training/do447-advanced-automation-ansible-best-practices) (and [EX447 Exam](https://www.redhat.com/en/services/training/ex447-red-hat-certified-specialist-advanced-automation-ansible-best-practices-exam))

## Practice Ansible

These are few use cases which you can try at your own environment for practicing Ansible. Try to do it by yourself (by searching on internet or using documentations) and refer to the links for quick help.

### Operating System

- **Package installation** - Create Ansible playbook to deploy multiple packages to Linux machine; create Ansible role and the package list should be able to pass to the role.
- **Linux OS patching** - Create Ansible playbook content to execute OS patching for Linux machines (choose your own flavor of Linux).
- **Bash Configuration** - Configure `~/.bashrc` using Ansible
- **`motd` and `etcd`** configuration - Confgure OS files using Ansible. Use Jinja2 template, `lineinfile` or `blockinfile` modules as needed. 

### Infrastructure Management

- **Public Coud (AWS, GCP, Azure)** - Develop Ansible content to create/delete AWS resources such as ec2, load balancers, disks, databases, keypairs, security groups, vpc etc. Check [Ansible for Infrastructure Provisioning in AWS](https://www.techbeatly.com/ansible-for-infrastructure-provisioning-in-aws-ansible-real-life-series/) for references. 
- **Private Cloud** - Develop Ansible content to create and manage private cloud resources (VMWare, OpenStack etc).


### Extra

- Ansible Collection - Download and use Ansible collections from Ansible Galaxy. Refer [Getting Started with Ansible Collections](https://www.techbeatly.com/getting-started-with-ansible-collections/)
- Email - Send an email using Ansible (Use Gmail or your own SMTP server). Refer [How to send email using Ansible and Gmail](https://www.techbeatly.com/ansible-gmail/)

## References

- [Ansible Workshops](https://github.com/ansible/workshops) - Training Course for Ansible Automation Platform