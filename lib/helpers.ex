defmodule Heroicons.Helpers do
  # @base 0.25

  # w-6
  def size("outline", "normal"), do: [width: "1.5rem", height: "1.5rem"]
  # w-5
  def size("solid", "normal"), do: [width: "1.25rem", height: "1.25rem"]

  # w-5
  def size("outline", "small"), do: [width: "1.25rem", height: "1.25rem"]
  # w-4
  def size("solid", "small"), do: [width: "1rem", height: "1rem"]

  # w-7
  def size("outline", "large"), do: [width: "1.75rem", height: "1.75rem"]
  # w-6
  def size("solid", "large"), do: [width: "1.5rem", height: "1.5rem"]
end
