defmodule LearnOtpTest do
  use ExUnit.Case
  doctest LearnOtp

  test "greets the world" do
    assert LearnOtp.hello() == :world
  end
end
