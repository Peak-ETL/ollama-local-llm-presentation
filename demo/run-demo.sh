#!/usr/bin/env bash
# Terminal run of show. Terminal first on purpose: same prompt, same machine,
# one flag between the two Qwen runs — no editor or extension in the way.
set -euo pipefail

PROMPT="write a hello world program in python"

echo "== 1. baseline: gemma4:12b =="
time ollama run gemma4:12b "$PROMPT"

echo
echo "== 2. qwen3:14b, thinking on by default =="
time ollama run qwen3:14b "$PROMPT"

echo
echo "== 3. qwen3:14b with thinking off — same prompt, one flag =="
time ollama run qwen3:14b --nothink "$PROMPT"

echo
echo "== 4. what is resident, and for how long =="
ollama ps
