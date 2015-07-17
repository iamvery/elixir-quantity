defmodule QuantityTest do
  use ExUnit.Case

  test "string conversion" do
    length = Quantity.feet(3)
    assert "#{length}" == "3 feet"

    length = Quantity.inches(12)
    assert "#{length}" == "12 inches"
  end

  test "inflection" do
    length = Quantity.feet(1)
    assert "#{length}" == "1 foot"

    length = Quantity.inches(1)
    assert "#{length}" == "1 inch"
  end
end
