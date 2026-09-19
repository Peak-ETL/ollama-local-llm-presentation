# Demo materials

## Terminal (first)

`run-demo.sh` walks the four steps shown on the demo slide: a baseline with Gemma 4,
Qwen with thinking on, Qwen with `--nothink`, then `ollama ps` to show what is resident
and what switching models costs.

Terminal first because it is the honest comparison — no editor, extension settings or
network in the way, and the `--nothink` toggle is a single visible flag.

## VS Code (second)

Open `hello_world.py`, pick a model in the Ollama connector, and ask for a hello world
in Python. Then switch models and ask again. The program is one line on purpose: with
the answer never in doubt, what is left to compare is time to first token and what each
model piles on around it — comments, a main guard, imports, extra code paths.

## Modelfile

`Modelfile.qwen3-fast` bakes thinking mode off into a reusable variant, which is the
option that scales to a team — everyone points at the same model instead of each person
remembering a flag.
