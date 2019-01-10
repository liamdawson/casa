#!/usr/bin/env bash

function _linux_only() { 
  if [[ $_HOST_ID == "linux" ]] 
  then 
    $@ 
  fi 
}

function _not_linux() {
  if ! [[ $_HOST_ID == "linux" ]] 
  then 
    $@ 
  fi 
}
 
function _macos_only() { 
  if [[ $_HOST_ID == "macos" ]] 
  then 
    $@ 
  fi 
} 

function _not_macos() {
  if ! [[ $_HOST_ID == "macos" ]] 
  then 
    $@ 
  fi 
}
 
function _windows_only() { 
  if [[ $_HOST_ID == "windows" ]] 
  then 
    $@ 
  fi 
}

function _not_windows() {
  if ! [[ $_HOST_ID == "windows" ]] 
  then 
    $@ 
  fi 
}

function command-exists() {
  command -v "$1" >/dev/null 2>&1
  return $?
}
