# Spin Demo

## Carriage return and char from a sequence

```python
from time import sleep

chars = '|/-\\' * 10

for char in chars:
    print('\r' + char, end='')
    sleep(.1)
```

## Define function with cleanup

```python
def spin():
    for char in chars:
        print('\r' + char, end='')
        sleep(.1)
    print()
```

## Try it out

```python
spin()
```
