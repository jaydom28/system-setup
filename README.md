# System setup

This script is intended to be run on a fresh linux install so that I have all the packages and software I typically rely on.

The **bootstrap.sh** script is designed to be **idempotent** and will install pyenv, create a default global virtualenv
called **user** and then install ansible into that virtualenv. The ansible playbook at `ansible/setup.yml` will then be
executed to handle the rest.

```sh
$ bash bootstrap.sh
```
