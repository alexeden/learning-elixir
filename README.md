# Modules

### Directives

Module directives are lexically scoped.
There are 3 of them:

1. `import` syntax

```
import Module [, only:|except: ]
```

2. `alias`
3. `require`

### Attributes




# Type equivalencies

- **Keyword lists** are lists of two-value tuples

# Notation shortcuts

## Keyword lists

#### Creating a keyword list

```
[ name: "Alex", age: "25" ]
```

*is shorthand for*

```
[ {:name, "Alex"}, {:age, "25"} ]
```

#### As the last argument of a function call

```
DB.save record, [ {:name, "Alex"}, {:age, "25"} ]
```
*since a keyword list is the last argument, we can write this as*
```
DB.save record, name: "Alex", age: "25"
```

#### As the last item wherever a list of values is expected

```
[ 1, {:name, "Alex"}, {:age, "25"} ]
```
*since the keyword list is the `tail` here, we can write*
```
[ 1, name: "Alex", age: "25" ]
```
and, conversely,
```
{ 1, [name, "Alex", age, "25"] }
```
*can be written as*
```
{ 1, name: "Alex", age: "25" }
```





> In Elixir:

#### Pattern matching

- `=` is called the *match operator*
- `_` is the wildcard variable
- `^` forces a pattern match to use a variable's existing value

#### Lists
- `|` is the `[head | tail]` operator
  - It's the same thing as `:` in Haskell
- `++` concatenates lists
- `--` finds the difference of lists
- `in` determines if a value is a member of a list
