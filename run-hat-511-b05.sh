#!/usr/bin/env bash
# HAT ai-mux 5.1.1 - B05: chon va nho account taskforce-02, roi tra lai account cu.
# Goi Claude that 2 lan (-p "ok"): 1 lan --account taskforce-02, 1 lan ai-mux khong co --account.
# Trap luon tra lai ~/.ai-mux/selected-account tu ban sao luu, ke ca khi loi hoac Ctrl-C.
f=~/hat511-b05-$(hostname -s)-$(date +%m%d-%H%M).txt
sel=~/.ai-mux/selected-account
bak=~/selected-account.truoc-b05
cp -p "$sel" "$bak" || { echo "Khong sao luu duoc $sel - dung lai"; exit 1; }
trap 'cp -p "$bak" "$sel"' EXIT
export LANG=C
{ echo "ngay: $(date '+%d/%m/%Y %H:%M:%S')  may: $(hostname)  user: $(id -un)  selected truoc=$(cat $bak)"
  run() { echo; echo "=== [$1] \$ $2"; bash -c "$2" 2>&1; echo "exit=$?"; }
  run B05 'ai-mux --account taskforce-02 -p "trả lời đúng một chữ: ok"'
  run B05 "cat $sel"
  run B05 'ai-mux status | head -20'
  run B05 'ai-mux status --json | python3 -c "import json,sys;print(\"selected =\",json.load(sys.stdin).get(\"selected\"))"'
  run B05 'ai-mux -p "trả lời đúng một chữ: ok"'
  run B05 "cat $sel"
  cp -p "$bak" "$sel"
  run KHOIPHUC "cat $sel; diff $bak $sel && echo 'da tra lai account cu'"
  run KHOIPHUC 'ai-mux status | head -20'
} | tee "$f"
echo; echo "Da luu: $f"
