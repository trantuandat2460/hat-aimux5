# HAT ai-mux 5.0.x — sandbox

Bước 1: chạy `bash run-hat.sh`. Script chạy các mục 1, 2, 4, 5 và phần version của mục 3, rồi lưu output vào `~/hat-aimux5-*.txt`.

| # | Lệnh | PASS khi |
|---|------|----------|
| 1 | `sudo ai-mux admin status` | Ra ai-mux 5.0.1 (hoặc bản mới hơn), bảng có viền, không lỗi, exit=0 |
| 2 | `ai-mux status` | Thấy claude 2.1.292, báo chưa có account (đúng với sandbox lúc này), không lỗi lạ |
| 3a | `ai-mux codex --version` | `codex-cli 0.154.0` |
| 3b | `ai-mux codex` → gõ `hi` → gõ `/status` | Có câu trả lời, provider là **codex-lb**. Thoát bằng Ctrl+C hai lần (**làm tay**) |
| 4 | `ai-mux herdr --version` | `herdr 0.9.1-aimux.3` |
| 5 | `claude --version`, `claude -p hi` | Trả lời được, exit=0, không bị đòi login lại |
| 6 | Desktop VNC, VS Code (panel Claude Code và ChatGPT), 1–2 tool EDA | Mở bình thường (**làm tay**). Nếu panel đòi sign-in thì ghi lại, vì sandbox chưa có account chung |

Bước 2: gửi file `~/hat-aimux5-*.txt` kèm kết quả 3b và 6 cho Vayne để lập bảng PASS/FAIL.
