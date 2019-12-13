defmodule StringAndBinary do

  def is_printable([]), do: true
  def is_printable([ head | tail]) do
    cond do
      head < 32 || head > 126 ->
        false
      true -> 
        is_printable(tail)
    end
  end

  def anagram(word1, word2) do
    w1 = Enum.sort word1
    w2 = Enum.sort word2

    w1==w2
  end

  def calc(calculation), do: _calc(calculation, '')
  
  def _calc([], value), do: Parse.number(value)

  def  _calc([digit | tail], current_value) when digit in '0123456789' do
    _calc(tail, current_value ++ [digit])
  end

  def _calc([ ?\s | tail], value), do: _calc(tail, value)

  def _calc([operation | tail], value) do
    case operation do
      ?- -> Parse.number(value) - _calc(tail, '')
      ?+ -> Parse.number(value) + _calc(tail, '') 
      ?* -> Parse.number(value) * _calc(tail, '')
      ?/ -> Parse.number(value) / _calc(tail, '') 
      _ -> "Unknown operation #{operation}"
    end
  end

end

