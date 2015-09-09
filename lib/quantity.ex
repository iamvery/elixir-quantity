defmodule Quantity do
  defstruct magnitude: 0, unit: :unknown

  def of(%{unit: unit} = quantity, unit), do: quantity
  def of(%{magnitude: value, unit: current_unit}, new_unit) do
    convert(value, current_unit, new_unit) |> of(new_unit)
  end
  def of(value, unit), do: %Quantity{magnitude: value, unit: unit}

  def convert(value, :feet, :inches), do: value * 12 # inches per foot
  def convert(value, :inches, :feet), do: value / 12 # inches per foot

  def add(%{unit: unit} = first, %{unit: unit} = second) do
    of(first.magnitude + second.magnitude, unit)
  end
  def add(first, second), do: of(second, first.unit) |> add(first)

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
