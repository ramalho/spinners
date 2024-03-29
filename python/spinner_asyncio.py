#!/usr/bin/env python3

# spinner_asyncio.py

# credits: Example by Luciano Ramalho inspired by
# Michele Simionato's multiprocessing
# example posted in the python-list on Feb 17 2009.

# BEGIN SPINNER_ASYNCIO
import asyncio
import itertools


DELAY = .1  # seconds


async def spin(msg):  # <1>
    for char in itertools.cycle('⠇⠋⠙⠸⠴⠦'):
        status = f'\r{char} {msg}'
        print(status, flush=True, end='')
        try:
            await asyncio.sleep(DELAY)  # <2>
        except asyncio.CancelledError:  # <3>
            break
    blanks = ' ' * len(status)
    print(f'\r{blanks}\r', end='')


async def slow_function():  # <4>
    # pretend waiting a long time for I/O
    await asyncio.sleep(3)  # <5>
    return 42


async def supervisor():  # <6>
    spinner = asyncio.create_task(spin('thinking!'))  # <7>
    print('spinner object:', spinner)  # <8>
    result = await slow_function()  # <9>
    spinner.cancel()  # <10>
    return result


def main():
    result = asyncio.run(supervisor())  # <11>
    print('Answer:', result)


if __name__ == '__main__':
    main()
# END SPINNER_ASYNCIO
