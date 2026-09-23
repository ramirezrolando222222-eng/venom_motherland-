#!/usr/bin/env bash

# ============================================================
#   DIABLO CHOLO — TERMINAL TAKEOVER MODE
# ============================================================

# Screen wipe effect
diablo_wipe() {
  for i in {1..20}; do
    clear
    printf "\e[38;5;160m"
    printf "%*s\n" $((i)) "█"
    printf "\e[0m"
    sleep 0.03
  done
}

# Red pulse background flood
diablo_flood() {
  clear
  printf "\e[48;5;160m"
  for i in {1..25}; do
    printf "                                                                                \n"
  done
  printf "\e[0m"
}

# Diablo warning banner
diablo_warning() {
  clear
  echo -e "\e[38;5;160m"
  echo "██████████████████████████████████████████████████████████████████████████"
  echo "██                                                                      ██"
  echo "██                 D I A B L O   C H O L O   T A K E O V E R            ██"
  echo "██                                                                      ██"
  echo "██████████████████████████████████████████████████████████████████████████"
  echo -e "\e[0m"
  sleep 0.6
}

# Diablo takeover message
diablo_takeover_msg() {
  local msg="Motherland terminal seized by Diablo Cholo..."
  local delay=0.04

  echo -e "\e[38;5;160m"
  for (( i=0; i<${#msg}; i++ )); do
    printf "%s" "${msg:$i:1}"
    sleep $delay
  done
  echo -e "\e[0m"
  sleep 0.4
}

# Main takeover sequence
diablo_takeover() {
  diablo_wipe
  diablo_flood
  diablo_warning
  diablo_takeover_msg
}

