defmodule Quantity do
  def of(quantity = %{unit: unit}, unit), do: quantity
  def of(quantity, unit) when is_map(quantity) do
    new_magnitude = convert(quantity.magnitude, quantity.unit, unit)
    of(new_magnitude, unit)
  end
  def of(magnitude, unit), do: %{magnitude: magnitude, unit: unit}

  def convert(magnitude, :feet, :inches), do: magnitude * 12 # inches per foot
end
