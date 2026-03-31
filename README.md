I believe that it is 100% possible to establish algorithms in dependently-typed languages such that they are what you and I might intuitively think of as "executable thoughts."
I also believe that it is possible to establish proof of an algorithm's intent by covering the surface area of said "intent" with "enough testing."

And that's basically the reasoning behind why I started this repo. I'm looking to establish the above, using Delphi (or really whatever else might be able to compile this when I might get done with it). Yeah, I know I'm not working in a dependently-typed language, so I realize we're not talking about "executable thoughts" here. But it still seems like a worthwhile goal to me. Either I get there or I don't. Either way, I'll be able to establish some collection of entities such that I can genuinely say the following to you:
"I've tried to provide a combination of testing and transparency such that any Delphi programmer who understands the source code in this repo, knows that if he/she/they/etc. find a bug, it's probably elsewhere.
And if it turns out that the bug is here, please please please let me know so I can add a test (i.e., let me know so I can permanently fix it)."

**TLDR: Pretty much the repo title explains it; the goal is to have proven entities.**
Oh noes.. I almost forgot to mention.
Everything I'm developing is being done 100% in Delphi 12 CE (Delphi 12.1 Patch 1). Apologies if that is problematic for your situation. The realm at which these tests are being executed MAY REQUIRE that you use Delphi 12.1 Patch 1 _just to get any valid feeback from the IDE_.
