#!/usr/bin/env bash
# HAT ai-mux 5.1.1 - phan 1: chi doc, khong goi Claude, khong doi cau hinh ai-mux.
# Muc: A01 A02 A03 B01 B02 B07 B13 B15 B17(phan cua minh) D01(status) F01 F02 F03
f=~/hat511-p1-$(hostname -s)-$(date +%m%d-%H%M).txt
{ echo "ngay: $(date '+%d/%m/%Y %H:%M:%S')  may: $(hostname)  user: $(id -un)  LANG=$LANG TERM=$TERM"
  run() { echo; echo "=== [$1] \$ $2"; bash -c "$2" 2>&1; echo "exit=$?"; }
  run A01 "ai-mux status"
  run A02 "type -a claude; claude --version"
  run A03 "ai-mux help"
  run A03 "ai-mux admin help"
  run B01 "ai-mux account list"
  run B02 "id -Gn"
  run B07 "ai-mux status --json | python3 -m json.tool"
  run B07 "ai-mux status --json | grep -ciE 'sk-ant|oat01|token\"[[:space:]]*:[[:space:]]*\"[^\"]{20,}' || true"
  run B13 "ai-mux go </dev/null"
  run B13 "ai-mux whoami </dev/null"
  run B13 "ai-mux stats </dev/null"
  run B15 "LANG=C LC_ALL=C ai-mux status"
  run B15 "COLUMNS=60 ai-mux account list"
  run B17 "ls -ld ~/.ai-mux; ls -la ~/.ai-mux; for h in /home/*; do [ \"\$h\" = \"\$HOME\" ] || ls \"\$h/.ai-mux\" 2>&1 | head -1 | sed \"s|^|\$h: |\"; done | head -5"
  run F01 "ai-mux admin status"
  run F02 "sudo ai-mux admin status"
  run F03 "sudo -l | grep -i ai-mux"
  run x   "ls -l ~/.ai-mux/selected-account; cat ~/.ai-mux/selected-account"
} | tee "$f"
echo; echo "Da luu: $f"
