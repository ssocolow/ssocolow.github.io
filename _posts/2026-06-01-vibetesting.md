---
title: "Vibe testing"
date: 2026-06-01
categories:
  - blog
tags:
  - ideas
  - ai
---

I love experiments. At the heart of an experiment is a question. And what drives a question is curiosity. Modern AI tools accelerate the curious by reducing friction from the tasks of gathering information and building prototypes. We can move faster. These days, whenever I'm mildly curious about something, I just hold the power button on my pixel and ask a question directly to gemini.

In the spirit of 'vibe coding', I'd like to propose the idea of 'vibe testing'. 'Vibe testing' involves using AI to help plan, execute, and interpret an experiment. The experiment that inspired this idea emerged from a question I had about my sleep. Does my air purifier (a [Levoit Core Mini-P](https://www.amazon.com/LEVOIT-Purifiers-Freshener-Core-Mini/dp/B09GTRVJQM)) help me sleep better?

I have a [Garmin Forerunner 255 Music](https://www.garmin.com/en-US/p/780196/) watch that generates a sleep score (0-100) after each night's sleep, taking into account duration, types of sleep (light, deep, REM), and heart rate variability (HRV). So I decided to conduct a randomized experiment to see if I could reject the null hypothesis (that my air purifier doesn't improve my sleep). I chose 15 out of the next 30 nights uniformly at random without replacement and assigned them to be the nights with the air purifier on. I wrote those nights in red on my whiteboard and the other nights in black. Then I executed the experiement and each night wrote my sleep score in green underneath the night's number. Here's what it looked like when I finished:

![my experiment whiteboard](/assets/images/sleepscores.png)

Then, I used gemini to transcribe my whiteboard data collection to a CSV. To verify the transcription's accuracy, I checked 10 random days, ensuring the CSV matched the whiteboard. Assuming gemini makes errors uniformly at random with respect to day (not quite true because my handwriting on some days is worse than others), this makes me confident enough for this experiment to trust the CSV's accuracy.

At first I tried to have gemini conduct the data analysis itself, but this led to some hallucinations (see the Conclusion section of the pdf in [this chat](https://gemini.google.com/share/b702ee5a55da) where gemini claimed 0.0225 > 0.05). So I vibe coded an [R script](https://gemini.google.com/share/42d978ace0ea) to perform Welch's t-test using a standard library, something more in-distribution for the model.

My average sleep score for nights with the purifier is 95.13, average without purifier is 90.73. The t-test yields a p-value of 0.04825, so this is evidence that my air purifier *does* help me sleep better! My current theory is that it is the white noise made by the fan, not the air filtration, that is helping me sleep. But this is a question for another day.

Zooming out, considering how easy AI made this experiment, I think I will vibe test more questions in the future. In the far future, I can imagine a smart home that can create and conduct randomized experiments like this one autonomously. With wearable biometric devices like smart watches and smart home environment controls, I could imagine something like the prompt "design, schedule, and execute an experiment to determine which temperature in the range 60-70 degrees Fahrenheit I sleep the best at" to actually succeed.

Taken even further, this idea becomes something like autoresearch (which I'm watching with keen interest - [karpathy](https://github.com/karpathy/autoresearch), [quantum circuit optimization](https://www.ecdsa.fail/), and [glite](https://github.com/GliteTech/glite-arf)). Autoresearch on myself, with AI as the experimenter and myself as the subject and beneficiary of results.

This is an awesome possible future, and one I'd love to help build.