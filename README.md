Elixir Quantities
===========

A library to manage quantities of particular units in Elixir.

## Measurement

### Representation as string
```elixir
length = Quantity.of(3, :feet)
IO.puts "Length is #{length}"
# => Length is 3 feet
```

### Quantity Conversion

```elixir
length_in_inches = Quantity.of(length, :inches)
IO.puts "Length is #{length_in_inches}"
# => Length is 36 inches
```

### Arithmetic

```elixir
total_length = Quantity.add(length, length_in_inches)
IO.puts "Length is #{total_length}"
# => Length is 6 feet

total_length = Quantity.add(length_in_inches, length)
IO.puts "Length is #{total_length}"
# => Length is 72 inches
```

## TODO

* The ability to infer conversions.
  e.g. Given conversion from inches to feet and feet to meters, it should be able to get from inches to meters.
* DRY'er arithmetic implementation.
* Inflections are intentionally naive right now.
  Maybe use something like https://github.com/nurugger07/inflex?
