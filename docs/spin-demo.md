# Spin Demo


```python
>>> from time import sleep
>>> chars = '|/-\\' * 10
>>> for char in chars:
...   print('\r' + char, end='')
...   sleep(.1)
... 
\>>> def spin():
...    for char in chars:
...      print('\r' + char, end='')
...      sleep(.1)
...    print()
... 
>>> spin()
\
>>> spin()
\
>>> spin()
\
```