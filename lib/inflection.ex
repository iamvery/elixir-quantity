defmodule Inflection do
  def pluralize("inch"), do: "inches"
  def pluralize("inches"), do: "inches"
  def pluralize("foot"), do: "feet"
  def pluralize("feet"), do: "feet"
  def pluralize(thing), do: pluralize(to_string(thing))

  def singularize("inches"), do: "inch"
  def singularize("inch"), do: "inch"
  def singularize("feet"), do: "foot"
  def singularize("foot"), do: "foot"
  def singularize(thing), do: singularize(to_string(thing))
end
