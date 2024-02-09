defmodule Chr.Print do
  @moduledoc """
  Print module
  """

  @doc """
  print box
  """
  def print_box(content, opts \\ []) do
    title = Keyword.get(opts, :title, "")
    color = Keyword.get(opts, :color, :white)

    content
    |> String.trim_leading()
    |> Owl.Box.new(
      title: title,
      padding_x: 2,
      padding_y: 1,
      border_tag: color
    )
  end

  @doc """
  print count number
  """
  def print_count_number(counts, title, color, min_height \\ 5) do
    counts
    |> Owl.Box.new(
      title: title,
      padding_x: 2,
      padding_y: 1,
      border_tag: color,
      min_height: min_height
    )
  end

  @doc """
  print count bar
  """
  def print_count_bar(percents, title, color, min_height \\ 5) do
    percents
    |> Owl.Box.new(
      title: title,
      padding_x: 2,
      padding_y: 1,
      border_tag: color,
      min_height: min_height
    )
  end

  @doc """
  count stringify
  """
  def count_stringify(span, first, second) do
    first
    |> String.pad_leading(span, " ")

    "#{first} #{second} "
  end

  @doc """
  percent stringify
  """
  def percent_stringify(title, count) when is_atom(title) do
    label =
      title
      |> Atom.to_string()
      |> String.slice(0, 3)
      |> String.capitalize()

    value = String.duplicate("▓", count)

    "#{label} #{value}"
  end

  def percent_stringify(title, count) do
    label = title

    value = String.duplicate("▓", count)

    "#{label} #{value}"
  end

  @doc """
  print top commands
  """
  def print_top_commands(histories) do
    histories
    |> Chr.top_commands()
    |> Enum.map(fn {command, count} ->
      count_stringify(5, count |> Integer.to_string(), command)
    end)
    |> Enum.join("\n")
    # FIXME: Owl's bug: right border malposition when title has emoji
    # |> print_count_number("🏆 Top Commands", :red)
    |> print_count_number("Top Commands", :red)
  end

  @doc """
  print top directories
  """
  def print_top_directories(histories) do
    histories
    |> Chr.top_directories()
    |> Enum.map(fn {directory, count} ->
      count_stringify(5, count |> Integer.to_string(), directory)
    end)
    |> Enum.join("\n")
    # |> print_count_number("📂 Top Directories", :red, 5)
    |> print_count_number("Top Directories", :red)
  end

  defp busiest_day_stringify({day, count}) do
    "#{count} commands on #{day}"
  end

  @doc """
  print busiest day
  """
  def print_busiest_day(histories) do
    histories
    |> Chr.busiest_day()
    |> busiest_day_stringify()
    # |> print_count_number("💦 Busiest Day", :green)
    |> print_count_number("Busiest Day", :green)
  end

  @doc """
  print weekly activity
  """
  def print_weekly_activity(histories) do
    histories
    |> Chr.weekly_activity()
    |> Enum.map(fn {day, count} ->
      percent_stringify(day, count)
    end)
    |> Enum.join("\n")
    # |> print_count_bar("📅 Weekly Activity", :yellow)
    |> print_count_bar("Weekly Activity", :yellow)
  end

  @doc """
  print daily activity
  """
  def print_daily_activity(histories) do
    histories
    |> Chr.daily_activity()
    |> Enum.map(fn {hour, count} ->
      percent_stringify(hour, count)
    end)
    |> Enum.join("\n")
    # |> print_count_bar("🕑 Daily Activity", :magenta)
    |> print_count_bar("Daily Activity", :magenta)
  end

  @doc """
  print logo
  """
  def print_logo() do
    """
    ███████╗    ██╗  ██╗    ██████╗
    ██╔════╝    ██║  ██║    ██╔══██╗
    ██║         ███████║    ██████╔╝
    ██║         ██╔══██║    ██╔══██╗
    ╚██████╗    ██║  ██║    ██║  ██║
     ╚═════╝    ╚═╝  ╚═╝    ╚═╝  ╚═╝  Commands History Report

    Made with ❤️ by ThaddeusJiang
    source code: https://github.com/ThaddeusJiang/chr
    """
    |> String.trim()
    |> Chr.Print.print_box(color: :cyan)
  end
end
