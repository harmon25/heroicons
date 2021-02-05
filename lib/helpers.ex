defmodule Heroicons.Helpers do
  def merge_attrs(type, size, opts \\ []) do
    Keyword.merge(dimensions(type, size), opts)
  end

  # w-4
  defp dimensions("outline", "tiny"), do: calc_dimension(4)
  # w-5
  defp dimensions("outline", "small"), do: calc_dimension(5)
  # w-6
  defp dimensions("outline", "normal"), do: calc_dimension(6)
  # w-7
  defp dimensions("outline", "large"), do: calc_dimension(7)

  # w-3
  defp dimensions("solid", "tiny"), do: calc_dimension(3)
  # w-4
  defp dimensions("solid", "small"), do: calc_dimension(4)
  # w-5
  defp dimensions("solid", "normal"), do: calc_dimension(5)
  # w-6
  defp dimensions("solid", "large"), do: calc_dimension(6)

  @increment 0.25
  defp calc_dimension(size_int, unit \\ "rem") do
    size = "#{size_int * @increment}" <> unit

    [width: size, height: size]
  end
end
