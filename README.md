Elixir Quantities
===========

A library to manage quantities of particular units in Elixir.

## Measurement

### Representation as string
```elixir
length = Quantity.feet(3)
IO.puts "Length is #{length}"
# => Length is 3 feet
```

### Quantity Conversion

```elixir
length_in_inches = Quantity.inches(length)
IO.puts "Length is #{length_in_inches}"
# => Length is 36 inches
```

### Arithmetic

```elixir
total_length = Quantity.feet(1) + Quantity.inches(6)
IO.puts "Length is #{total_length}"
# => Length is 1.5 feet
```
