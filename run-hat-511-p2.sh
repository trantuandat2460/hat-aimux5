#!/usr/bin/env bash
# HAT ai-mux 5.1.1 - phan 2: B04 B06 B08 B14(--model). Goi Claude that 3 lan tren account dang chon.
# B04 doi ten ~/.ai-mux/selected-account roi tra lai ngay (trap dam bao tra lai ca khi loi).
f=~/hat511-p2-$(hostname -s)-$(date +%m%d-%H%M).txt
sel=~/.ai-mux/selected-account
cp -p "$sel" ~/selected-account.truoc-p2 2>/dev/null
trap '[ -f "$sel.bak" ] && mv "$sel.bak" "$sel"' EXIT
{ echo "ngay: $(date '+%d/%m/%Y %H:%M:%S')  may: $(hostname)  user: $(id -un)  selected=$(cat $sel)"
  run() { echo; echo "=== [$1] \$ $2"; bash -c "$2" 2>&1; echo "exit=$?"; }
  mv "$sel" "$sel.bak"
  run B04 "ai-mux </dev/null"
  run B04 "ai-mux status | tail -3"
  mv "$sel.bak" "$sel"
  run B04 "cat $sel; diff $sel ~/selected-account.truoc-p2 && echo 'da tra lai'"
  run B06 'ai-mux -p "trả lời đúng một chữ: ok"'
  run B08 'ANTHROPIC_API_KEY=x ANTHROPIC_AUTH_TOKEN=x ai-mux -p "trả lời đúng một chữ: ok"'
  run B14 'ai-mux --model sonnet -p "trả lời đúng một chữ: ok" --output-format json | python3 -c "import json,sys;d=json.load(sys.stdin);print(d.get(\"result\"),list((d.get(\"modelUsage\") or {}).keys()))"'
} | tee "$f"
echo; echo "Da luu: $f"
