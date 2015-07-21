defmodule QuantityTest do
  use ExUnit.Case

  test "equality" do
    assert Quantity.of(2, :inches) == Quantity.of(2, :inches)
  end

  test "self conversion" do
    length = Quantity.of(2, :feet)
    assert Quantity.of(length, :feet) == length

    length = Quantity.of(12, :inches)
    assert Quantity.of(length, :inches) == length
  end

  test "convert feet to inches" do
    length = Quantity.of(3, :feet)
    length_in_inches = Quantity.of(length, :inches)
    assert length_in_inches == Quantity.of(36, :inches)
  end

  test "convert inches to feet" do
    length = Quantity.of(12, :inches)
    length_in_feet = Quantity.of(length, :feet)
    assert length_in_feet == Quantity.of(1, :feet)
  end

  test "adding quantities of like units" do
    length = Quantity.of(2, :feet)
    assert Quantity.add(length, length) == Quantity.of(4, :feet)
  end

  @tag :skip
  test "adding quantities of differing units" do
    first = Quantity.of(2, :feet)
    second = Quantity.of(12, :inches)
    assert Quantity.add(first, second) == Quantity.of(3, :feet)
  end

  @tag :skip
  test "string conversion" do
    length = Quantity.of(3, :feet)
    assert "#{length}" == "3 feet"

    length = Quantity.of(12, :inches)
    assert "#{length}" == "12 inches"
  end

  @tag :skip
  test "inflection" do
    length = Quantity.of(1, :feet)
    assert "#{length}" == "1 foot"

    length = Quantity.of(1, :inches)
    assert "#{length}" == "1 inch"
  end
end
