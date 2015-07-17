defmodule Quantity do
  defstruct magnitude: nil, unit: nil

  def inches(quantity = %{unit: :inches}), do: quantity
  def inches(magnitude) when is_number(magnitude) do
    %Quantity{magnitude: magnitude, unit: :inches}
  end

  def feet(quantity = %{unit: :feet}), do: quantity
  def feet(magnitude) when is_number(magnitude) do
    %Quantity{magnitude: magnitude, unit: :feet}
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
