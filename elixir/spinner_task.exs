#! /usr/bin/env elixir

defmodule Spinner do
  # milliseconds
  @delay 100
  def spin(computation, msg) do
    "⠇⠋⠙⠸⠴⠦"
    |> String.graphemes()
    |> Stream.cycle()
    |> spin(computation, msg)
  end

  def spin(char_stream, computation, msg) do
    char = Enum.at(char_stream, 0)
    status = "\r#{char} #{msg}"

    case Task.yield(computation, @delay) do
      {:ok, result} ->
        blanks = String.duplicate(" ", String.length(status))
        IO.write("\r#{blanks}\r")
        result

      nil ->
        IO.write(status)

        char_stream
        |> Stream.drop(1)
        |> spin(computation, msg)
    end
  end

  def slow_function() do
    Process.sleep(3000)
    42
  end

  def supervisor() do
    computation = Task.async(&slow_function/0)
    spin(computation, "thinking!")
  end

  def main() do
    result = supervisor()
    IO.puts("Answer: #{result}")
  end
end

Spinner.main()
