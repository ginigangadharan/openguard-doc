---
title: Overview
tags:
 - overview
description: OpenGuard Overview
---

## OpenGuard - Overview

![OpenGuard High Level Design](/assets/img/openguard-hld.png){:class="img-responsive"}

**OpenGuard** is a zero-touch security automation project build on top of multiple Open-Source tools and softwares.

This project is focusing on safeguarding the IT infrastructure and environment by monitoring the security incidents and automatically remediating them based on industrial security standards and benchmarks. The name **OpenGuard** - Security Automation and Remediation came from the concept of guarding the IT infrastructure environment using open-source tools.

### OpenGuard Dashboard

![Dashboard](/assets/img/dashboard.png)

### OpenGuard Engine

**OpenGuard** is the incident collection and decision making engine which will listen to the standard monitoring and alerting tools.

### OpenGuard Runner

**OpenGuard Runner** is the remediation tools which will collect talk to the OpenGuard app and collect the remediation job details. Once the job is completed, OpenGuard Runner will update back to the OpenGuard engine and incident will mark as resolved.
