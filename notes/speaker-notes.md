# Speaker notes — Local LLMs for Coding with Ollama

Extracted from the `<aside>` element on each slide, in presentation order.

## 1. Local LLMs for Coding with Ollama

`cover`

Welcome, quick framing: this is a ~1hr working session, not a polished vendor pitch. I'll show what I've actually set up, where it's rough, and where it's promising.

## 2. About Me

`about-me`

Quick personal intro before diving in — same bio I use across Peak ETL talks, with a nod to what brought me to this one.

## 3. What We'll Cover

`agenda`

_No notes._

## 4. The Tool Itself

`what-is-ollama`

Quick level-set before we get into why local, our setup, and the models — Ollama is the "Docker for LLMs" comparison people reach for: it doesn't invent a new inference engine, it packages one (llama.cpp) with a good CLI, a model registry, and a standard API. The pyramid reads bottom-up: your hardware is the foundation, llama.cpp sits on it, Ollama packages that, and your editor rides on top.

## 5. Why Go Local — Reason 1

`why-cost`

Personal motivation: reduce token spend on routine work. The bars are schematic — the point is the order of magnitude between a completion and an agent loop, not exact ratios. Frame the next slide as the enterprise version of the same argument.

## 6. Why Go Local — Reason 2

`why-privacy`

This is the pitch I'd make to the org even if the cost savings weren't there: air-gapped or offline dev environments, client work under NDA, regulated codebases. The two paths at the top are the whole argument in one picture.

## 7. The Honest Tradeoffs

`why-tradeoffs`

Balance the pitch here — this is the slide where I'd rather the skeptics in the room interrupt than stay quiet. The bars make the point: the spend doesn't vanish, it changes shape, and a chunk of it becomes people's time rather than a line item.

## 8. A Hybrid Split, In Practice

`why-hybrid-example`

Concrete example for orgs with mixed sensitivity: keep the local model as the default for anything touching the codebase or customer data, and let hosted/cloud models handle general questions and public content where the bigger, non-local models pay off. If asked "can Ollama enforce this": no — it routes by which model tag you pick (including its own :cloud tags), not by reading the prompt. LiteLLM (open-source proxy, supports Ollama plus ~100 cloud providers, tag-based routing rules) and Occludra Gateway (open-source PII/secret redaction and prompt-injection blocking) are the tools I'd point to if someone wants to go build this — worth its own session, not this one.

## 9. Where I Am Today

`setup-recap`

Keep this brisk — it's the recap, not the content. Point at the screenshots quickly rather than reading them aloud; the interesting part starts next slide.

## 10. How It Connects

`vscode-integration`

Ollama exposes an OpenAI-compatible-ish REST API on localhost:11434. The VS Code extension is just an HTTP client against that endpoint — same pattern as Continue, Copilot's BYOK Ollama support, etc. Worth a one-liner: any internal app can hit that same API directly (an internal chatbot, a docs lookup tool, a Slack bot) — not just editors. That's a separate talk.

## 11. First Impressions

`first-impressions`

Set up the mystery here before revealing the cause on the next two slides: it's very likely Qwen3's default "thinking" mode, not the model itself being slower per-token. The bars are schematic — the point is that the wait is front-loaded, before any visible output.

## 12. The Likely Culprit

`thinking-issue`

This matches what I found in Ollama's own tracker: thinking is a per-request or per-Modelfile setting, not something the VS Code extension currently exposes as a toggle. The sample is illustrative — point at the pink block and note that in an editor you often do not even see it, you just wait.

## 13. Three Ways To Turn It Off

`thinking-fix`

The Modelfile route is the one that scales to a team — everyone points at the same variant instead of each person remembering a flag. Options 1 and 2 are fine for trying it out or for a script.

## 14. Beyond First Impressions

`benchmarks`

Be explicit that these are two different things: the three tags I actually ran, and bigger models I have not. On the MoE row: "A3B" means ~3B active parameters per token, which buys speed — all 35B still have to fit in VRAM, so it is a ~21 GB model that runs like a much smaller one. Good place to ask the room what cards they have.

## 15. Before You Pull a Model

`hardware`

Good moment to ask what cards people in the room have — the answer decides which half of this deck is relevant to them. Apple Silicon counts differently: unified memory means a 32 GB Mac can hold models a 24 GB discrete card cannot.

## 16. Picking a Model By Task

`recommendations`

This is the framework I'd want the team to walk away with: pick the model to match the latency tolerance of the task, not just "the best benchmark score." Note the agentic column needs more GPU than I have — that one is a recommendation from the published numbers, not from my own runs.

## 17. The Economics

`cost-economics`

Deliberately no dollar figures — the chart has no axis numbers on purpose. Pull our real usage from the team's API bills before putting a specific ROI claim in front of anyone. The honest answer to "when does local win?" is "depends on your volume", and the crossing point is the whole story. Call out the steps in the cyan line: if you want to stay on the biggest models, the GPU spend recurs roughly annually — it flattens only if you are happy to sit on the hardware you have.

## 18. Live Demo

`demo`

Terminal first on purpose: same prompt, same machine, one flag between the two runs — no editor, extension settings or network in the way, so the comparison is honest and the --nothink toggle is obvious. Watch the gap before the first token; that is the argument from a few slides ago, live. If a model is slow to load, talk over it — that wait is itself the point. Fallback if the demo breaks: the screenshots on the setup slide. VS Code comes after this, once the difference is clear.

## 19. Now In VS Code

`demo-vscode`

Hello world is deliberately trivial: nobody argues about whether the output is correct, so the room watches the two things that actually differ day to day — time to first token, and how much each model writes around the one line that matters. Expect comments, a main guard, unnecessary imports, or extra code paths and error handling depending on which model answers; that is a property of the model, not of how the prompt was worded. Switch the model in the connector live so they see it is the same editor and file throughout. If autocomplete is cooperating, type the first few characters and let it finish the line instead of using chat.

## 20. Lessons So Far

`gotchas`

Keep the tone matter-of-fact here; a list of rough edges buys credibility for everything claimed earlier. On the last card: Ollama now serves hosted models through the same localhost address as local ones — the only difference is the model name (a :cloud suffix) and being signed in. So "I called localhost" does not prove the work happened on your machine; the model tag is what decides. Matters for the privacy argument earlier.

## 21. Where To Go Deeper

`resources`

The three commands are the real ask: anyone with a decent GPU can be running a local model before the end of the day. On integrations: Ollama now exposes an Anthropic-compatible API, so Claude Code points at it with one command (ollama launch claude, or the ANTHROPIC_BASE_URL env var). Cursor is the odd one out — its prompt assembly runs in Cursor's cloud, so a local model needs ngrok or a Cloudflare tunnel, and at that point your code is leaving the machine anyway. Also offer my notes doc so people don't repeat the same trial and error.

## 22. Thank You

`thanks`

Land on the three takeaways, then open it up. If the room is quiet, the opener is asking what cards people have — that usually starts the conversation about what they could run tonight.
