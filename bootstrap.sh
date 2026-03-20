#!/bin/bash

# If pyenv isn't installed, get the necessary packages and run the installer script
if ! command -v pyenv >/dev/null; then
    export PYENV_ROOT="${HOME}/.pyenv"
    export PATH="${PYENV_ROOT}/bin:${PATH}"
    sudo apt-get update -y
    sudo apt-get install -y make build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
    curl https://pyenv.run | bash
    eval "$(pyenv init -)"
else
    echo "Pyenv is already installed and in the path"
fi

python_version="3.13.5"
virtualenv_name="user"
if ! pyenv versions --bare | grep "^${python_version}/envs/${virtualenv_name}$" > /dev/null; then
    pyenv install "${python_version}"
    pyenv virtualenv "${python_version}" "${virtualenv_name}"
    pyenv global "${virtualenv_name}"
elif pyenv versions --bare | grep "^${virtualenv_name}/envs" > /dev/null; then
    echo "The user ${virtualenv_name} exists with a different python version installed, choose a different virtualenv name or python version"
    exit 1
else
    echo "The virtualenv ${virtualenv_name} with version ${python_version} already exists"
fi 

if ! pip freeze | grep 'ansible' > /dev/null; then
    pip install --no-input ansible
else
    echo "Ansible is already installed for ${virtualenv_name}"
fi

echo 'Running the setup playbook now'

ansible-playbook ansible/setup.yml -i 'localhost,' -K -c local
