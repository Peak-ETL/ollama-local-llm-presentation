# Demo materials

## Terminal (first)

`run-demo.sh` walks the three steps shown on the demo slide: a baseline with Gemma 4,
a Qwen comparison, then `ollama ps` to show what is resident and what switching models
costs.

Terminal first because it is the honest comparison — no editor, extension settings or
network in the way.

## VS Code (second)

Open `hello_world.py`, pick a model in the Ollama connector, and ask for a hello world
in Python. Then switch models and ask again. The program is one line on purpose: with
the answer never in doubt, what is left to compare is time to first token and what each
model piles on around it — comments, a main guard, imports, extra code paths.

