defmodule Bowling.Tenpin do
  # strike
  def score([10, bonus1, bonus2 | tail]) do
    10 + bonus1 + bonus2 + score([bonus1, bonus2 | tail])
  end

  # spare
  def score([spare1, spare2, bonus | tail]) when spare1 + spare2 == 10 do
    spare1 + spare2 + bonus + score([bonus | tail])
  end

  # open frame
  def score([roll1, roll2 | tail]) when roll1 + roll2 < 10 do
    roll1 + roll2 + score(tail)
  end

  # fallthrough
  def score([_ | _]), do: 0 # incomplete/unscoreable frame
  def score([]), do: 0 # no rolls left
end
