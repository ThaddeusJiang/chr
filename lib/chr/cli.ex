defmodule Chr.Cli do
  @moduledoc """
  CLI module
  """

  @ignore_commands ["cd", "pwd", "clear", "exit", "ls", "code"]

  @doc """
  main function
  """
  def main(_ \\ []) do
    histories = Chr.get_history_list()

    Chr.Print.print_logo()
    |> Owl.IO.puts()

    Chr.Print.print_top_commands(histories, @ignore_commands)
    |> Owl.IO.puts()

    Chr.Print.print_top_directories(histories)
    |> Owl.IO.puts()

    Chr.Print.print_busiest_day(histories)
    |> Owl.IO.puts()

    Chr.Print.print_weekly_activity(histories)
    |> Owl.IO.puts()

    Chr.Print.print_daily_activity(histories)
    |> Owl.IO.puts()
  end
end
