## Strings and litrals 

# Hexdocs

""" -> is treated as hecsdocs 
eg:

```
"""
ajalkjsdk
"""
```


# Sigils

Capital chars will not check for interpolations and escapings

- ~C{lasjd} ->  Here "{}" are delimitor
- ~c
- ~s
- ~S
- ~w
- ~W
- ~r
- ~R


Any non word character can be a delimitor -> Delimitor won't check for internal error like the interpolation here
`~s{#{a}`
here return value will be three char string.

# Double quotes "Strings" and Single quoted "Character lists"

```
iex> str = 'wombat'
    'wombat'
iex> is_list str
    true
```

You can look at the internal representation in a number of ways:

```
iex> str = 'wombat'
  'wombat'
iex> :io.format "~w~n", [ str ]
  [119,111,109,98,97,116]
  :ok
```


