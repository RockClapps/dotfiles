#!/bin/bash

if [[ $(bluetoothctl show | grep Powered | awk '{ print $2 }') == no ]]
then
  rfkill unblock bluetooth
  bluetoothctl power on
else
  bluetoothctl power off
fi
