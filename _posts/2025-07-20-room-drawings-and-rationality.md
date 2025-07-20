---
title: "Room Drawings and Rationality"
date: 2025-07-20
categories:
  - game theory
tags:
  - rationality
---
This is a story about a clever protocol, an unlikely implementation, and an ironic ending.

I'm living in a house with eight friends next year. There are nine rooms total, so everyone gets a single. We had to figure out who gets what room. Two of my friends had done all the administrative work with the landlord, so we let them get first pick. That left seven of us. We each ranked our room preferences, (e.g. Room #8 most preferred, Room #4 2nd most preferred, ...) and put them into a spreadsheet. I was taking computational game theory at the time with Tomasz Wąs, my tutor, and so brought the issue to him. How do we maximize everyone's preferences and assign everyone to a room? Some rooms (like Room #8) were ranked first by multiple people, and some rooms (like Room #9) were at the bottom of most people's rankings. But someone was going to get Room #9. What is the optimal way to construct a fair assignment of people to rooms based on their preferences?

Tomasz's research focus is computational social choice and on what voting / distribution algorithms satisfy certain properties so he knew our options and showed me this website [matchu.ai](http://www.matchu.ai/). This is a mechanism design problem. We could go with [Random Serial Dictatorship (RSD)](http://www.matchu.ai/rsd), where we randomly select a person, they are assigned to their highest ranked room, then we remove that room from everyone else's lists, then choose the next person. This algorithm has a fairness property (in that it treats everyone as equals), an efficiency property (no subgroups of people would be willing to swap rooms ex post), and truthfulness (no one could benefit from misreporting their rankings). Our other option was [Probabilistic Serial Rule (PSR)](http://www.matchu.ai/psr). PSR is a little more complicated. Borrowing from the matchu website:

>It works as follows: suppose items are different types of pizzas. Each agent starts "eating" her top choice pizza at the same rate as every other agent. Once a pizza is consumed, agents move to their next preferred pizza; until all pizzas are eaten.

Then these probabilities can be broken down into a weighted sum of permutation matricies (with ones and zeros that assign people to rooms) and one of these can be drawn randomly but with respect to its weight. Ask your favorite LLM if you want more info.

PSR has advantages and disadvantages compared with RSD.
- PSR is ex ante **envy-free**. In PSR, the lottery you recieve (the distribution over what room you will get) is guarenteed to be your optimal lottery (you don't envy (like more than your own) anyone else's lottery). In RSD, you may envy the lottery someone else has (this is a subtle point but RSD remains strategy proof because if you replicate the other person's rankings that may backfire on your lottery's expected utility).
- PSR
  >guarantees the prescribed probabilistic matching (lottery) is efficient, meaning that no other lottery exists that can strictly improve the outcome for some participants without making other participants worse off.
  So in PSR the lottery *itself* is Pareto efficient, whereas in RSD the lottery's outcome is Pareto efficient.
- RSD, however, is **strategy-proof**, meaning agents have no incentive to lie about their preferences. In some scenarios under PSR, agents can improve their expected utility by reporting a preference ranking that is not their true preference ranking.
- PSR is difficult to explain (not a technical reason against it but certainly an implementational one).

Ok, back to the story. In the group chat, my friend said "let's just choose rooms randomly". Vehemently opposed to this, as we could do a lot better than random, I disagreed and said "why don't we try to maximize everyone's preferences jointly?". However, this was my first mistake. Had I been more rational, many messages and misunderstandings could have been avoided. After arguments and a poll, I got the group to mark down their room preference rankings in a table in Google Docs. Discussing with Tomasz, we decided to go with Random Serial Dictatorship (where a random order is decided and people choose rooms in that order) because 1. RSD is easy to explain and easy to understand why it's fair (the most important reason) and 2. it is strategy-proof (not that important but I got a bit carried away with making our mechanism as anti-adversarial as possible). I then proposed RSD to the group.

It turned out that my friend's initial suggested mechanism ("let's just choose rooms randomly") was actually about deciding an order randomly (so exactly RSD)! Much argument was involved because I didn't understand that what he was proposing was exactly what I was proposing. The blame for that lies on both of us (although probably a bit more on me). He should've been clearer about what he actually meant. I should have been clear-headed enough to recognize that very few people would actually propose to assign rooms to people *at random* and that drawing a pick order was a pretty common thing so this was what he actually meant when he said "choosing rooms randomly".

At this point, we had conquered our misunderstanding and were ready to draw an order for rooms. This is when my interest in cryptography and mechanism design was piqued by a challenge. My friends and I were spread across the world - if someone randomly generated pick orders, how could we trust them to not fudge the results in their favor? I wanted to make the system **uncheatable**. I created this protocol:
1. Number each participant (assuming <= 10 participants)
2. Establish a date/time in the future to run the protocol
3. Extract the top headline of the New York Times website
4. Use [SHA3-512](https://emn178.github.io/online-tools/sha3_512.html) to get a hash from the headline
5. Go through the hash from the left and each participant number encountered adds them next in the draw order (e.g. given 7b8f723, 7 chooses then 8 then 2 (7 has already chosen)).
6. In the *very* unlikely event that the hash doesn't contain enough of these distinct digits to make a full draw order, take the hash of the hash and continue with that.

Therefore, everyone could be very certain that none of us (unless they could control the NYT headline) was fudging the draw because everyone could verify for themselves the protocol result.

Explaining the rationale for this to the group, I justified it as a fun experiment and also that it eliminates any possible suspicion about the person doing the draw. When someone said "why don't we just all hop on a zoom where someone uses a random spinner website" I replied with "they could have edited the website to favor themselves first". Their response was that only I would be capable of doing that.

We hopped on a call and at this point in the debate I had resigned to using the spinner because I really didn't think anyone was trying to cheat. It was clear my protocol was seen as unnecessary by some of the group (which in fairness it totally was). But then, like a gift from the gods, one of the leaders of our group said "why don't we try Simon's thing? And then nobody argued against that so I got my chance.

I used my protocol, generated the hash, looked through the hash and began to call out the pick order! This is when my second mistake struck. I was thinking to myself "I am calling out the room order, it would look bad if I'm too early, let's hope I'm not too early, let's hope I'm not too early", making super duper super sure that everyone else thought this protocol was fair. I had veered off the course of rationality and was about to pay the price. Unconciously (I believe) I skipped over my own number the first time it appeared in the readout. I was also rushing as I read out the numbers (bad idea). It is hard to keep track of where you are in a hash. Then I finished (correctly noting the *second* time my number appeared), double checked, and realized my mistake. My *third* mistake was not saying anything there and in the moment - 'Hey actually I messed up and I'm in front of you in the order'. I didn't want to hurt my pride, to reveal that I made a mistake implementing my algorithm, when I had argued and pushed so hard for us to use it.

Putting on my behavioral pysch hat, I think I primed myself to not see my own number when reading the hash. I shot myself in the foot. Next year, my room will be worse than if I followed my algorithm properly, with a clear head, and without hurried biased thoughts.