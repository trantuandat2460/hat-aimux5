#!/usr/bin/env bash
# HAT ai-mux 5.0.x tren sandbox — chi doc trang thai, khong doi cau hinh ai-mux.
# Chay: bash run-hat.sh   (lenh dau can sudo)
f=~/hat-aimux5-$(hostname -s)-$(date +%m%d-%H%M).txt
{ echo "ngay: $(date '+%d/%m/%Y %H:%M:%S')  may: $(hostname)  user: $(id -un)"
  run() { echo; echo "=== [$1] \$ $2"; bash -c "$2" 2>&1; echo "exit=$?"; }
  run 1 "sudo ai-mux admin status"
  run 2 "ai-mux status"
  run 3 "ai-mux codex --version"
  run 4 "ai-mux herdr --version"
  run 5 "type -a claude"
  run 5 "claude --version"
  run 5 'claude -p hi'
} | tee "$f"
echo; echo "Da luu: $f"
echo "Con lam tay: muc 3 (ai-mux codex -> go hi -> /status xem provider codex-lb) va muc 6 (xem CHECKLIST.md)."
