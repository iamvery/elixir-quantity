defmodule QuantityTest do
  use ExUnit.Case

  test "string conversion" do
    length = Quantity.feet(3)
    assert "#{length}" == "3 feet"
  end

  test "inflection" do
    length = Quantity.feet(1)
    assert "#{length}" == "1 foot"
  end
end
