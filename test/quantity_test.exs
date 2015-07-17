defmodule QuantityTest do
  use ExUnit.Case

  test "string conversion" do
    length = Quantity.feet(3)
    assert "#{length}" == "3 feet"
  end
end
