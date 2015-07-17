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
total_length = Quantity.add(length, length_in_inches)
IO.puts "Length is #{total_length}"
# => Length is 6 feet

total_length = Quantity.add(length_in_inches, length)
IO.puts "Length is #{total_length}"
# => Length is 72 inches
```

## THOUGHTS

```elixir
defmodule Quantity do
  # struct #Quantity<magnitude, unit>

  # using pattern matching to implement conversions

  def feet({magnitude, :feet}) do
    # self
  end

  def feet({magnitude, :inches}) do
    # magnitude / 12, :feet
  end
end
```
