#!/bin/bash
sensors BAT0-acpi-0 | grep 'power1' | awk '{print $2 " " $3}'
