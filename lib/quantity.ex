defmodule Quantity do
  defstruct magnitude: 0, unit: :unknown

  def of(quantity = %{unit: unit}, unit), do: quantity
  def of(%{magnitude: magnitude, unit: current_unit}, new_unit) do
    new_magnitude = convert(magnitude, current_unit, new_unit)
    of(new_magnitude, new_unit)
  end

  def of(magnitude, unit) do
    %Quantity{magnitude: magnitude, unit: unit}
  end

  def convert(value, :feet, :inches), do: value * 12 # inches per foot
  def convert(value, :inches, :feet), do: value / 12 # inches per foot

  def add(first = %{unit: unit}, second = %{unit: unit}) do
    of(first.magnitude + second.magnitude, unit)
  end

  def add(first = %{unit: first_unit}, second) do
    add(first, of(second, first_unit))
  end

  def inflect(%{magnitude: magnitude, unit: unit}) when magnitude == 1 do
    Inflection.singularize(unit)
  end

  def inflect(%{unit: unit}) do
    Inflection.pluralize(unit)
  end
end

defimpl String.Chars, for: Quantity do
  def to_string(quantity) do
    "#{quantity.magnitude} #{Quantity.inflect(quantity)}"
  end
end
