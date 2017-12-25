defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    list = ["wink", "double blink", "close your eyes",  "jump"]
    joined = Integer.digits(code, 2)
             |> Enum.reverse()
             |> Enum.zip(list)
    only_ones = Enum.filter(joined, fn x -> elem(x, 0) === 1 end)
    actions = Enum.map(only_ones, fn x -> elem(x, 1) end)
    if Enum.at(Integer.digits(code, 2), 4) === 1 do
      Enum.reverse(actions)
      else
      actions
    end
  end
end

