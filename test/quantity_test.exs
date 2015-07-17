defmodule QuantityTest do
  use ExUnit.Case

  test "string conversion" do
    length = Quantity.of(3, :feet)
    assert "#{length}" == "3 feet"

    length = Quantity.of(12, :inches)
    assert "#{length}" == "12 inches"
  end

  test "inflection" do
    length = Quantity.of(1, :feet)
    assert "#{length}" == "1 foot"

    length = Quantity.of(1, :inches)
    assert "#{length}" == "1 inch"
  end

  test "self conversion" do
    length = Quantity.of(2, :feet)
    assert Quantity.of(length, :feet) == length

    length = Quantity.of(12, :inches)
    assert Quantity.of(length, :inches) == length
  end

  test "unit conversion" do
    length = Quantity.of(3, :feet)
    length_in_inches = Quantity.of(length, :inches)
    assert "#{length_in_inches}" == "36 inches"

    length = Quantity.of(12, :inches)
    length_in_feet = Quantity.of(length, :feet)
    assert "#{length_in_feet}" == "1.0 foot"
  end
end
