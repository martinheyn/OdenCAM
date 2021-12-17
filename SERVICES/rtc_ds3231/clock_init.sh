#!/bin/bash
sleep 15
echo ds3231 0x68 > /sys/class/i2c-adapter/i2c-1/new_device

hwclock -s -f /dev/rtc1
ntpdate -b -s -u 192.168.188.2
hwclock -w -f /dev/rtc1
hwclock -w -f /dev/rtc0
#sleep 15

#echo 0x68 > /sys/class/i2c-adapter/i2c-1/delete_device
