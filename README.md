
williamyeh.nvm-nodejs for Ansible Galaxy
============


## Summary

Role name in Ansible Galaxy: **[williamyeh.nvm-nodejs](https://galaxy.ansible.com/list#/roles/2689)**

This Ansible role has the following features for [NVM](https://github.com/creationix/nvm) & [Node.js](http://nodejs.org/):

 - Install specific version of NVM.
 - Install specific version of Node.js (including [io.js](https://iojs.org/)) via NVM.

This role will install NVM *globally*. If you prefer NVM being installed *on a per-user basis* (i.e., on `$HOME/.nvm` directory of each user), try alternatives such as [g-div/ansible-nvm](https://github.com/g-div/ansible-nvm).



## Role Variables

### Mandatory variables

Variables needed to be defined in user's playbook:

```yaml
nodejs_version
```

For example:

```yaml
nodejs_version: "v0.10.35"
```

Use `nvm ls-remote` command to get a list of valid version strings.


### Optional variables

User-configurable defaults:

```yaml
# parent path of NVM to be installed on
nvm_parent_path:   /opt

# path of NVM to be installed on;
# never override it unless absolutely necessary!
nvm_install_path:  "{{ nvm_parent_path }}/nvm"
```


## Usage


### Step 1: add role

Add role name `williamyeh.nvm-nodejs` to your playbook file.


### Step 2: add variables

Set vars in your playbook file.

Simple example:

```yaml
---
# file: simple-playbook.yml

- hosts: all

  roles:
    - williamyeh.nvm-nodejs

  vars:
    nodejs_version: "v0.10.35"
```


## Caveat

If your server's locales haven't been configured correctly, you may encounter the following error:

> "your locale in your local machine is set to XXX, which SSH forwards to and tries to use on the server, but your server does not have it installed."
> Source: [Ask Ubuntu](http://askubuntu.com/questions/144235/locale-variables-have-no-effect-in-remote-shell-perl-warning-setting-locale-f)

To solve this problem, you may use [williamyeh.reset-locale](https://galaxy.ansible.com/list#/roles/2716) beforehand. Its document also contains more information about this issue and possible alternatives, if you prefer a more complete locale solution.



## Dependencies

None.


## License

Licensed under the Apache License V2.0. See the [LICENSE file](LICENSE) for details.


## History

Rewritten from my pre-Galaxy version: [server-config-template](https://github.com/William-Yeh/server-config-template).

During refactoring, some roles on Ansible Galaxy also inspired me:

  - [leonidas.nvm](https://galaxy.ansible.com/list#/roles/694) forks, especially [ahmednuaman.nvm-ahmed](https://galaxy.ansible.com/list#/roles/2298) and then [g-div/ansible-nvm](https://github.com/g-div/ansible-nvm)
 

