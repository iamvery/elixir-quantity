defmodule Quantity do
  defstruct magnitude: 0, unit: :unknown

  def of(quantity = %{unit: unit}, unit), do: quantity
  def of(quantity, unit) when is_map(quantity) do
    new_magnitude = convert(quantity.magnitude, quantity.unit, unit)
    of(new_magnitude, unit)
  end
  def of(magnitude, unit), do: %Quantity{magnitude: magnitude, unit: unit}

  def convert(magnitude, :feet, :inches), do: magnitude * 12 # inches per foot
  def convert(magnitude, :inches, :feet), do: magnitude / 12 # inches per foot

  def add(first = %{unit: unit}, second = %{unit: unit}) do
    of(first.magnitude + second.magnitude, unit)
  end
  def add(first, second) do
    add(first, of(second, first.unit))
  end

  def inflect(%{magnitude: magnitude, unit: unit}) when magnitude == 1 do
    Inflection.singularize(unit)
  end
  def inflect(quantity), do: Inflection.pluralize(quantity.unit)
end

defimpl String.Chars, for: Quantity do
  def to_string(quantity) do
    "#{quantity.magnitude} #{Quantity.inflect(quantity)}"
  end
end
