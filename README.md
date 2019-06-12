# spinners

Simple concurrent programming examples inspired by Michele Simionato's multiprocessing example posted in the `python-list` on Feb 17 2009.

Simionato's example is like a concurrent "Hello, World!". While a main thread pretends to do some work for 3 seconds, a function concurrently displays a spinning prompt.

For me, the main point of the examples is to demonstrate different ways of synchronizing the main thread and the spinning prompt: how to make the spinning stop and clean up after the main thread finishes its "slow" task.

In this repo you will find the same example implemented in different languages, sometimes using different synchronization


> The `python-list` archive seems to be rebuilt from time to time, changing
> the URLs to specific messages. 
> If yow want to read Simionato's original message, 
> you need to find one of three messages in the thread titled
> "Will multithreading make python less popular?"
> in the Feb 2009 archive page [sorted by author](https://mail.python.org/pipermail/python-list/2009-February/author.html).


