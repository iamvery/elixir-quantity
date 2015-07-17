defmodule Quantity do
  defstruct magnitude: nil, unit: nil

  def feet(magnitude) do
    %Quantity{magnitude: magnitude, unit: :feet}
  end
end

defimpl String.Chars, for: Quantity do
  def to_string(quantity) do
    "#{quantity.magnitude} #{quantity.unit}"
  end
end
