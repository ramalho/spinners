# spinners

Simple concurrent programming examples inspired by Michele Simionato's 
[multiprocessing example](https://standupdev.github.io/spinners/) posted in the
[python-list](https://mail.python.org/pipermail/python-list/2009-February/author.html) on Feb 17 2009.

![GIF animation showing spinning character prompt.][spinner]

[spinner]: https://standupdev.github.io/spinners/spinner-50ms.gif "GIF screen capture"


Simionato's example is like a concurrent "Hello, World!": while the main thread pretends to do some work for 3 seconds, a function displays a spinning prompt
<i>concurrently</i>.

For me, the main point of the examples in this repository is to demonstrate different ways of synchronizing the main thread and the spinning function: how to make the spinning stop and clean up after the main thread finishes its "slow" task.

In this repo you will find the same example implemented in different languages,  using different synchronization techniques.

> The `python-list` archive seems to be rebuilt from time to time, changing
> the URLs of specific messages.
> That's why I made a [local copy](https://standupdev.github.io/spinners/) of Simionato's message. 
> If yow want to read his original message in context, 
> you need to find one of three messages in the thread titled
> "Will multithreading make python less popular?"
> in the Feb 2009 archive page [sorted by author](https://mail.python.org/pipermail/python-list/2009-February/author.html).


