defmodule Quantity do
  def of(quantity = %{unit: unit}, unit), do: quantity
  def of(magnitude, unit), do: %{magnitude: magnitude, unit: unit}
end
