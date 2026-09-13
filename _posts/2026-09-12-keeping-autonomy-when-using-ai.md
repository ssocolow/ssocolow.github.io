---
title: "Autonomy preservation"
date: 2026-09-12
categories:
  - blog
tags:
  - ai
---

When I'm using coding agents like Claude code or Codex, I often experience a failure mode that I think is pretty common among humans using these tools. The failure mode manifests itself as an experience that looks somewhat like the following:

```
Me: how does this system work and why is this part not working
AI: Great question, let me investigate.
AI: Gigantic response with a ten-step flowchart, a response explaining the load-bearing nature of the failing lines of code, and a prosposed fix.
Me: ok make that fix and test it
AI: Makes the change, tests it, says it's good.
Me: still not working, this time this other part is broken
AI: Great catch, here is how we can fix that too.
Me: make the change
AI: makes the change and provides several paragraphs on how previous change didn't cover what my brilliant insight pointed out but now everything will work.
Me: ok great looks like it's working
```

"That doesn't look like a failure" you say. I'm going to argue that it is. While the code now functions, what is left broken is my mental model of the system and the fix. The passivity of reading and occasionally prompting "continue" or "make the change" lulls me into a false sense of understanding. Learning is active - not passive.

I learned this lesson first in school. Before tests I would read the textbook to ensure my understanding was complete. This also lulled me into a false sense of security - my internal chain of thought being something like "yes I remember that part, and that, oh yeah and that". But far more effective was presenting myself with a problem, a sheet of paper, and a pencil (nothing else) and attempting to solve it. Often I struggled and failed in ways I could not have anticipated. My blind spots revealed themselves and I was able to actually learn.

For me to retain my autonomy, my ability to make informed decisions, my mental models need to be accurate. Accurate mental models are unfortunately not the default outcome when using AI to learn about something. One habit that I have found helpful in systematically combating this is to [notice](https://www.lesswrong.com/posts/GLPaZamxqkx7XJbXv/the-skill-of-noticing-emotions) when I'm in a situation where I want to be building a mental model but I'm being passive (not questioning, not feeling the stretch or the struggle that precedes understanding).

Once I'm aware that my quest for knowledge has been derailed, I have a strategy to pull myself back. It goes something like:

```
Me: my current mental model is that X fetches the data from Y then transforms it with Z and sends it to W. The issue is that Z needs to depend on the state of W and right now it doesn't do that right because ...
correct me.
```

I pretend that a friend has just put me on the spot by asking what's going on here. I answer to the best of my ability from whatever thoughts are floating around half-digested in my head (nothing else).

Then the model can correct me. By crystallizing my thoughts into words I can see how they break and that is really informative. 

I allow the model to reject with evidence or accept my explanations. This is often super helpful because upon discovering the place where my explanation shattered I can clearly see for myself *why* (often I ask for what source code lines are relevant).

With this new evidence, I can update my mental model efficiently because the feedback is so sharply focused on the objective artifact of my present understanding.

I think this strategy works by combining aspects of paraphrasing (verbalizing in my own words what someone else has said) and the Feynman technique (the best way to learn is to teach). Usually I will have already read an model-generated explanation in previous conversation turns before I employ my strategy. And I don't allow myself to scroll up and reread that explanation as I develop my own.

As model capabilities continue to improve, we need new techniques to ensure we can reliably construct accurate mental models of the systems we work with and what our agents are doing. This is how we can [augment our agency without sacrificing our autonomy](https://arxiv.org/abs/2504.18601). Let's have our cake and eat it too.

If this sounds like an interesting idea, I hope you give it a try! And let me know how it went.