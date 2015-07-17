defmodule Quantity do
  defstruct magnitude: nil, unit: nil

  def feet(magnitude) do
    %Quantity{magnitude: magnitude, unit: :feet}
  end

  def inflect(%{magnitude: magnitude, unit: unit}) when magnitude == 1 do
    Inflection.singularize(unit)
  end

  def inflect(%{magnitude: _, unit: unit}) do
    Inflection.pluralize(unit)
  end
end

defimpl String.Chars, for: Quantity do
  def to_string(quantity) do
    "#{quantity.magnitude} #{Quantity.inflect(quantity)}"
  end
end
