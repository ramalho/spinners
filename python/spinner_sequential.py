#!/usr/bin/env python3

# credits: spin function adapted from Michele Simionato's
# multiprocessing example posted on python-list, Feb 17 2009.


import itertools
import time


DELAY = .1  # seconds


def spin(msg, seconds):
    steps = seconds / DELAY

    for char in itertools.cycle('|/-\\'):
        status = f'\r{char} {msg}'
        print(status, flush=True, end='')
        steps -= 1
        if steps > 0:
            time.sleep(DELAY)
        else:
            break

    blanks = ' ' * len(status)
    print(f'\r{blanks}\r', end='')


def main():
    spin('thinking!', 3)
    print('Done.')


if __name__ == "__main__":
    main()
