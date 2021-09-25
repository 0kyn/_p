#!/usr/bin/env bash

_p_repo="0kyn/_p"
_p_repo_url="https://github.com/${_p_repo}"
_p_install_dir="${HOME}/._p"

_p_echo() {
  printf "> ${1} \n"
}

install() {
  # check if _p is installed
  if [[ -d "${_p_install_dir}" ]]; then
    _p_echo "_p is already installed in ${_p_install_dir}"

  else
    git clone --depth=1 "${_p_repo_url}" "${_p_install_dir}"
    mv "${_p_install_dir}/_p.config.example" "${_p_install_dir}/_p.config"
  fi

  # check if $_p_install_dir is present in $PATH
  if [[ ":${PATH}:" == *":${_p_install_dir}:"* ]]; then
    _p_echo "${_p_install_dir} is already present in \$PATH"
  else
    printf "\n# Add _p install directory to \$PATH}\nexport PATH=\"${_p_install_dir}:${PATH}\"" >>"${HOME}/.bashrc"

    _p_echo "Close and reopen your terminal to start using _p or run the following command: "
    printf "export PATH=\"${_p_install_dir}:${PATH}\""
  fi
}

install
