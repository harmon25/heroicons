# Heroicons

Generated [heroicon](https://heroicons.com/) Surface components

## Usage

Alias the either module `(Solid, Outline)` in a surface component, and use it!

```elixir

alias Heroicons.Solid

def render(assigns) do
~H"""
  <Solid name="briefcase" />
"""
end
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `heroicons` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:heroicons, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/heroicons](https://hexdocs.pm/heroicons).
