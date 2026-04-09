#!/bin/bash

set -euo pipefail

has_command() {
  command -v "$1" >/dev/null 2>&1
}

log() {
  printf '%s\n' "$1"
}

install_with_brew() {
  if brew list jira-cli >/dev/null 2>&1; then
    log "jira-cli is already installed via Homebrew."
    return 0
  fi

  log "Installing jira-cli with Homebrew..."
  if brew install jira-cli; then
    return 0
  fi

  log "Direct Homebrew install failed, trying the maintained tap..."
  brew tap ankitpokhrel/jira-cli
  brew install jira-cli
}

main() {
  if has_command jira; then
    log "jira CLI is already available: $(command -v jira)"
    exit 0
  fi

  if has_command brew; then
    install_with_brew
  else
    log "Homebrew is not installed, so this script cannot install jira-cli automatically."
    log "Install Homebrew first, or install jira-cli manually from:"
    log "https://github.com/ankitpokhrel/jira-cli/wiki/Installation"
    exit 1
  fi

  if ! has_command jira; then
    log "jira-cli installation finished but the 'jira' command is still unavailable."
    log "Open a new shell and run 'jira --help' to verify your PATH."
    exit 1
  fi

  log "jira CLI installed successfully."
  log "Next step: export JIRA_API_TOKEN and run 'jira init' to authenticate."
}

main "$@"
