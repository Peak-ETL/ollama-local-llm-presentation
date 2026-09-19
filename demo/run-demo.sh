#!/usr/bin/env bash
# Terminal run of show. Terminal first on purpose: same prompt, same machine,
# one flag between the two Qwen runs — no editor or extension in the way.
set -e

PROMPT="write a hello world program in python"

echo "== 1. baseline: gemma4:12b =="
time ollama run gemma4:12b "$PROMPT"

echo
echo "== 2. qwen3:14b =="
time ollama run qwen3:14b "$PROMPT"

echo
echo "== 3. what is resident, and for how long =="
ollama ps
