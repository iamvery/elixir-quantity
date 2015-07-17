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

  test "self conversion" do
    length = Quantity.feet(2)
    assert Quantity.feet(length) == length

    length = Quantity.inches(12)
    assert Quantity.inches(length) == length
  end

  test "unit conversion" do
    length = Quantity.feet(3)
    length_in_inches = Quantity.inches(length)
    assert "#{length_in_inches}" == "36 inches"

    length = Quantity.inches(12)
    length_in_feet = Quantity.feet(length)
    assert "#{length_in_feet}" == "1.0 foot"
  end
end
