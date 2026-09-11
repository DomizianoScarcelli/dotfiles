#!/bin/bash
# HID-level key remapping (no third-party software).
#
# All keyboards:
#   0x700000039 caps lock    -> 0x70000006D F18               (tmux prefix)
# Built-in MacBook keyboard only (it's an ISO board, so macOS swaps the two keys;
# this swaps them back so the key left of "1" is a backtick). External ANSI
# boards (Keychron K2) are detected as ANSI and must NOT get this swap.
#   0x700000035 grave/tilde <-> 0x700000064 non-US backslash

CAPS='{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x70000006D}'
GRAVE='{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000064},
       {"HIDKeyboardModifierMappingSrc":0x700000064,"HIDKeyboardModifierMappingDst":0x700000035}'
INTERNAL='{"Built-In":1,"PrimaryUsagePage":1,"PrimaryUsage":6}'   # the laptop's own keyboard, whichever Mac this is

case "${1:-apply}" in
  apply)
    hidutil property --set "{\"UserKeyMapping\":[$CAPS]}" > /dev/null
    hidutil property --matching "$INTERNAL" --set "{\"UserKeyMapping\":[$CAPS,$GRAVE]}" > /dev/null
    ;;
  reset)  hidutil property --set '{"UserKeyMapping":[]}' > /dev/null ;;
  status)
    echo "== all keyboards";      hidutil property --get "UserKeyMapping"
    echo "== internal keyboard";  hidutil property --matching "$INTERNAL" --get "UserKeyMapping"
    ;;
  *)      echo "usage: $0 {apply|reset|status}" >&2; exit 1 ;;
esac
