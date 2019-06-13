#! /usr/bin/env elixir

defmodule Spinner do
  # milliseconds
  @delay 100
  def spin(msg) do
    "⠇⠋⠙⠸⠴⠦"
    |> String.graphemes()
    |> Stream.cycle()
    |> spin(msg)
  end

  def spin(char_stream, msg) do
    char = Enum.at(char_stream, 0)
    status = "\r#{char} #{msg}"

    receive do
      {super_pid, :computed} ->
        blanks = String.duplicate(" ", String.length(status))
        IO.write("\r#{blanks}\r")
        send(super_pid, :done)
    after
      @delay ->
        IO.write(status)

        char_stream
        |> Stream.drop(1)
        |> spin(msg)
    end
  end

  def slow_function() do
    Process.sleep(3000)
    42
  end

  def supervisor() do
    pid = spawn(fn -> spin("thinking!") end)
    result = slow_function()
    send(pid, {self(), :computed})

    receive do
      :done -> result
    end
  end

  def main() do
    result = supervisor()
    IO.puts("Answer: #{result}")
  end
end

Spinner.main()
