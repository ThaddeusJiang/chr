defmodule Chr do
  @moduledoc """
  Chr module
  """

  @bar_chart_length 20

  @doc """
  return command history
  """
  def get_history_list() do
    shell = System.get_env("SHELL") |> String.split("/") |> List.last()
    history_path = Path.join(System.user_home!(), ".#{shell}_history")

    case File.read(history_path) do
      {:ok, history} ->
        history
        |> String.split("\n")
        |> Enum.reject(&(String.first(&1) !== ":"))

      {:error, _} ->
        []
    end
  end

  @doc """
  pick up command from history record

  ## Examples

      iex> Chr.pick_up_command(": 1707397937:0;cat ~/.zsh_history")
      "cat"

      iex> Chr.pick_up_command(": 1707397937:0;clear")
      "clear"
  """
  def pick_up_command(string) do
    string
    |> String.split(";")
    |> List.delete_at(0)
    |> List.first()
    |> String.split(" ")
    |> List.first()
  end

  @doc """
  pick up directory from history record

  ## Examples

      iex> Chr.pick_up_directory(": 1707397937:0;cd ~/projects/chr")
      "~/projects/chr"
  """
  def pick_up_directory(string) do
    [head | tail] =
      string
      |> String.split(";")
      |> List.delete_at(0)
      |> List.first()
      |> String.split(" ")

    case head do
      value when value in ["cd", "code", "vim", "zed", "open"] ->
        tail |> List.first()

      _ ->
        nil
    end
  end

  @doc """
  timestamp to datetime

  ## Examples

      iex> Chr.timestamp_to_datetime("1617226800")
      ~U[2021-03-31 21:40:00Z]
  """
  def timestamp_to_datetime(timestamp) do
    datetime = DateTime.from_unix!(timestamp |> String.to_integer(), :second)
    datetime
    # datetime |> DateTime.to_string()
  end

  @doc """
  top commands
  """
  def top_commands(history_list, ignore_commands) do
    history_list
    |> Enum.map(&pick_up_command/1)
    |> Enum.filter(fn command -> command not in ignore_commands end)
    |> Enum.reduce(%{}, fn command, acc ->
      Map.update(acc, command, 1, &(&1 + 1))
    end)
    |> Enum.into([])
    |> Enum.sort(fn {_, count1}, {_, count2} -> count2 < count1 end)
    |> Enum.take(10)
  end

  @doc """
  top directories
  """
  def top_directories(history_list) do
    history_list
    |> Enum.map(&pick_up_directory/1)
    |> Enum.reject(&is_nil/1)
    |> Enum.reject(&(String.length(&1) < 2 || String.ends_with?(&1, ".")))
    |> Enum.reduce(%{}, fn directory, acc ->
      Map.update(acc, directory, 1, &(&1 + 1))
    end)
    |> Enum.into([])
    |> Enum.sort(fn {_, count1}, {_, count2} -> count2 < count1 end)
    |> Enum.take(5)
  end

  @spec timezone_offset() :: integer()
  def timezone_offset() do
    local = NaiveDateTime.local_now() |> DateTime.from_naive!("Etc/UTC")
    utc = DateTime.utc_now()

    DateTime.diff(local, utc, :hour)
  end

  @doc """
  pick up date from history record

  ## Examples

      iex> Chr.pick_up_local_datetime(": 1707397937:0;cat ~/.zsh_history")
      ~U[2024-02-08 22:12:17Z]
  """
  def pick_up_local_datetime(string) do
    <<_::binary-size(2), timestamp::binary-size(10), _::binary>> = string

    timestamp
    |> String.to_integer()
    |> DateTime.from_unix!()
    |> DateTime.add(Chr.timezone_offset(), :hour)
  end

  @doc """
  pick up date from DateTime

  ## Examples

      iex> Chr.pick_up_date(~U[2021-03-31 00:00:00Z])
      ~D[2021-03-31]
  """
  def pick_up_date(datetime) do
    datetime
    |> DateTime.to_date()
  end

  @doc """
  pick up time from DateTime
  """
  def pick_up_hour(%{hour: hour}) do
    hour
  end

  @doc """
  pick weekday from DateTime

  ## Examples

      iex> Chr.pick_up_weekday(~U[2021-03-31 00:00:00Z])
      3
  """
  def pick_up_weekday(datetime) do
    datetime
    |> DateTime.to_date()
    |> Date.day_of_week()
  end

  @doc """
  busiest day
  """
  def busiest_day(history_list) do
    history_list
    |> Enum.map(&pick_up_local_datetime/1)
    |> Enum.map(&pick_up_date/1)
    |> Enum.reduce(%{}, fn date, acc ->
      Map.update(acc, date, 1, &(&1 + 1))
    end)
    |> Enum.into([])
    |> Enum.sort(fn {_, count1}, {_, count2} -> count2 < count1 end)
    |> List.first()
  end

  @doc """
  Weekly Activity

  ## Examples

      iex> Chr.weekly_activity([": 1709957744:0;cat .zsh_history",": 1710044144:0;cat .zsh_history"])
      [monday: 0, tuesday: 0, wednesday: 0, thursday: 0, friday: 0, saturday: 20, sunday: 20]
  """
  def weekly_activity(history_list) do
    map =
      history_list
      |> Enum.map(&pick_up_local_datetime/1)
      |> Enum.map(&pick_up_weekday/1)
      |> Enum.reduce(%{}, fn date, acc ->
        Map.update(acc, date, 1, &(&1 + 1))
      end)

    max = map |> Enum.into([], fn {_, count} -> count end) |> Enum.max()
    max = if max == 0, do: 1, else: max

    [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
    |> Enum.with_index(1)
    |> Enum.map(fn {day, index} ->
      {day, (Map.get(map, index, 0) / max * @bar_chart_length) |> round()}
    end)
  end

  @doc """
  Daily Activity

  ## Examples

      iex> Chr.daily_activity([": 1709957744:0;cat .zsh_history",": 1709968544:0;cat .zsh_history", ": 1710000944:0;cat .zsh_history"])
      [
        {"01", 20},
        {"02", 0},
        {"03", 0},
        {"04", 0},
        {"05", 0},
        {"06", 0},
        {"07", 0},
        {"08", 0},
        {"09", 0},
        {"10", 0},
        {"11", 0},
        {"12", 0},
        {"13", 20},
        {"14", 0},
        {"15", 0},
        {"16", 20},
        {"17", 0},
        {"18", 0},
        {"19", 0},
        {"20", 0},
        {"21", 0},
        {"22", 0},
        {"23", 0},
        {"24", 0}
      ]
  """
  def daily_activity(history_list) do
    map =
      history_list
      |> Enum.map(&pick_up_local_datetime/1)
      |> Enum.map(&pick_up_hour/1)
      |> Enum.reduce(%{}, fn date, acc ->
        Map.update(acc, date, 1, &(&1 + 1))
      end)

    max = map |> Enum.into([], fn {_, count} -> count end) |> Enum.max()
    max = if max == 0, do: 1, else: max

    1..24
    |> Enum.map(fn hour ->
      hour |> Integer.to_string() |> String.pad_leading(2, "0")
    end)
    |> Enum.with_index(1)
    |> Enum.map(fn {time, index} ->
      {time, (Map.get(map, index, 0) / max * @bar_chart_length) |> round()}
    end)
  end
end
