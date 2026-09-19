# Local LLMs for Coding with Ollama

A talk on running open-weight models locally with [Ollama](https://ollama.com) for
day-to-day coding work — what it costs, what it protects, where it falls short, and
how it compares to a hosted model in practice.

Presented by **Jason Holden**, CEO & Founder, [Peak ETL](https://www.peaketl.com).

---

## What this talk covers

Roughly a one-hour session for a developer audience:

- What Ollama actually is, and where it sits relative to llama.cpp and your hardware
- Why you might run models locally — token cost, data privacy — and the honest tradeoffs
- A working setup: Ollama + the VS Code connector, and the models pulled so far
- Gemma 4 vs Qwen: the perceived latency gap and how their response patterns differ
- Hardware reality: what each VRAM tier can actually hold
- Live demo, first in the terminal and then in VS Code
- Rough edges worth knowing before wiring this into a daily workflow

Models actually tested for this talk: `gemma4:e4b`, `gemma4:12b`, `qwen3:14b`.
Anything larger referenced in the deck is published figures, not first-hand testing.

## Repo layout

```
deck/
  deck.json          slide order, sections, and font registrations
  slides/            one HTML file per slide, in the deck's own format
  assets/            logo, headshot, and demo screenshots
  assets/ASSET-MAP.md  maps slide blob references to files
demo/
  hello_world.py     the VS Code demo target
  run-demo.sh        the terminal run of show
notes/
  speaker-notes.md   presenter notes for every slide, in order
```

## Slides

1. **Local LLMs for Coding with Ollama** — `deck/slides/cover.html`
2. **About Me** — `deck/slides/about-me.html`
3. **What We'll Cover** — `deck/slides/agenda.html`
4. **The Tool Itself** — `deck/slides/what-is-ollama.html`
5. **Why Go Local — Reason 1** — `deck/slides/why-cost.html`
6. **Why Go Local — Reason 2** — `deck/slides/why-privacy.html`
7. **The Honest Tradeoffs** — `deck/slides/why-tradeoffs.html`
8. **A Hybrid Split, In Practice** — `deck/slides/why-hybrid-example.html`
9. **Where I Am Today** — `deck/slides/setup-recap.html`
10. **How It Connects** — `deck/slides/vscode-integration.html`
11. **First Impressions** — `deck/slides/first-impressions.html`
12. **Beyond First Impressions** — `deck/slides/benchmarks.html`
13. **Before You Pull a Model** — `deck/slides/hardware.html`
14. **Picking a Model By Task** — `deck/slides/recommendations.html`
15. **The Economics** — `deck/slides/cost-economics.html`
16. **Live Demo** — `deck/slides/demo.html`
17. **Now In VS Code** — `deck/slides/demo-vscode.html`
18. **Lessons So Far** — `deck/slides/gotchas.html`
19. **Where To Go Deeper** — `deck/slides/resources.html`
20. **Thank You** — `deck/slides/thanks.html`

## Running the demo

Install Ollama from [ollama.com/download](https://ollama.com/download), then:

```bash
ollama pull gemma4:12b
ollama pull qwen3:14b
./demo/run-demo.sh
```

The terminal portion compares the two models on the same prompt. The VS Code portion
asks each model for a hello world in Python —
trivial on purpose, so the only things left to compare are time to first token and how
much scaffolding each model adds.

## About the deck source

The slides were built with Claude's Slides artifact type. Each file in `deck/slides/`
holds a single `<section>` on a fixed 1920x1080 canvas with inline styles, and
`deck/deck.json` defines the order. Speaker notes live in the `<aside>` element at the
end of each slide (also extracted to `notes/speaker-notes.md`).

Image references use the artifact's internal `/_blob/<id>` paths. Those resolve inside
the artifact but not in a checkout — see `deck/assets/ASSET-MAP.md` for the mapping if
you rebuild the deck elsewhere.

## Links referenced in the talk

- [ollama.com/library](https://ollama.com/library) — browse tags, sizes, quantizations
- [docs.ollama.com](https://docs.ollama.com) — Modelfile reference, REST API, editor setup
- [docs.ollama.com/integrations/claude-code](https://docs.ollama.com/integrations/claude-code) — Anthropic-compatible API
- [github.com/ollama/ollama](https://github.com/ollama/ollama) — issues and release notes
- [docs.continue.dev](https://docs.continue.dev) — autocomplete and chat config patterns

## License

No license has been chosen yet. Add one before making this repo public if you want
others to reuse the material.
