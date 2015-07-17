defmodule InflectionTest do
  use ExUnit.Case

  test "pluralization" do
    assert Inflection.pluralize("inch") == "inches"
    assert Inflection.pluralize("inches") == "inches"
    assert Inflection.pluralize("foot") == "feet"
    assert Inflection.pluralize("feet") == "feet"
    assert Inflection.pluralize("foot") == "feet"
  end

  test "singularization" do
    assert Inflection.singularize("inches") == "inch"
    assert Inflection.singularize("inch") == "inch"
    assert Inflection.singularize("feet") == "foot"
    assert Inflection.singularize("foot") == "foot"
  end
end
