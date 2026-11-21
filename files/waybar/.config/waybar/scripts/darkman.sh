#!/bin/bash
# Prints waybar JSON for the current darkman mode; always exits 0
mode=$(darkman get 2>/dev/null)
case "$mode" in dark|light) ;; *) mode=unknown ;; esac
printf '{"text":"%s","alt":"%s","tooltip":"darkman: %s (click to toggle)"}\n' "$mode" "$mode" "$mode"
