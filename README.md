# make_noop

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with make_noop](#setup)
    * [What make_noop affects](#what-make_noop-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with make_noop](#beginning-with-make_noop)
4. [Usage - Configuration options and additional functionality](#usage)
5. [MCO_Usage  - How to use the MCO application](#mco-usage
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

The module contains a MCollective Application and Agent that enables or disables via the `puppet.conf` file for most Puppet agents.

## Module Description

Manages MCollective Agent and Application.
The MCO Agent should be on most Puppet nodes.
The MCO Application should be on the node driving the 'noop' selection.

## Setup

Manages the MCo Agent and Application; restarts the MCollective service on change.

### Setup Requirements

Does not use pluginsync as we do not want all nodes to have these agents or applications, and needs to restart the MCollective service on change.

### Beginning with make_noop

By defaul the MCO Agent is created, but the MCO Application is not.

The can be part of a Profile, such as a SOE profile.

## Usage

## Reference

### Classes

#### make_noop

##### `include_agent`
Boolean value to determine if the MCO agent is installed and managed.
A `false` value will remove the agent.
Default is `true`.

##### `include_app`
Boolean value to determine if the MCO application is installed and managed.
A `false` value will remove the application.
Default is `false`.

## MCO Usage

To enable `noop` for all Puppet nodes in an environment perform the following with a MCO client:

```shell
  mco enable_noop
```

To disable `noop` for all Puppet nodes in an environment perform the following with a MCO client:

```shell
  mco disable_noop
```

## Limitations

Used and tested on CentOS/RHEL6

## Development

## Release Notes/Contributors/Etc
