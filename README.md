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


# Concurrency

The two simplest ways to kick off a process:

1. Run an anonymous function
2. Run a named function in a module, passing a list of arguments

## Spawning

- `spawn` returns a PID
- `spawn` does not explicitly cause a process to run; it just marks the code as being eligible for execution
- Linked (`spawn_link`) processes communicate in a 2-way manner such that if one process exits abnormally, it kills the other
- Monitored (`spawn_monitor`) processes communicate in a 1-way manner such that a process can spawn another and be notified of its termination, but not the other way around
- To convert exit signals from linked processes to a message that can be handled, you need to *trap the exit*


# Applications

- Think of an *application* as more of a *component* or a *service*
- A file name ending in `.app` is called an *application specification*, it defines your application to the runtime environment

Our application is defined within `mix.exs` within the `application` function definition.
The `mod:` option tells OTP the module that serves as the application's entry point.
The `registered:` option lists the names that our application will register. This ensures cross-application name uniqueness. 


# Operators

In Elixir...

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
