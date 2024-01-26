-module(chr).

-export([main/0, contains_substring/2]).

%% @spec get_histories() -> [string()]
get_histories() ->
    case file:read_file("/Users/tj/.zsh_history") of
        {ok, Bin} ->
            Str = binary_to_list(Bin),
            Lines = string:tokens(Str, "\n"),
            Lines;
        {error, Reason} ->
            io:format("Error: ~p~n", [Reason]),
            exit(Reason)
    end.

% Total count command histories
total(List) -> io:format("Total count command histories: ~p~n", [length(List)]).

% 🏆Top 10 commands
pick_command(Line) ->
    case string:tokens(Line, " ") of
        [_ | [Str | _]] ->
            case string:tokens(Str, ";") of
                [_ | [Command | _]] -> Command;
                [] -> ""
            end;
        [] ->
            ""
    end.

%% Line = ": 1706239413:0;cd git/ThaddeusJiang"
pick_directory(Line) ->
    case string:tokens(Line, ";") of
        [_ | [Command | _]] ->
            case string:tokens(Command, " ") of
                [_ | [Directory | _]] -> Directory;
                [_] -> nil;
                [] -> nil
            end;
        [] ->
            nil
    end.

pick_date(Line) ->
    Str = string:substr(Line, 3, 10),
    {Int, _} = string:to_integer(Str),
    {Date, _} = calendar:system_time_to_local_time(Int, 1),
    Date.

pick_weekday(Line) ->
    Str = string:substr(Line, 3, 10),
    {Int, _} = string:to_integer(Str),
    {Date, _} = calendar:system_time_to_local_time(Int, 1),
    Day = calendar:day_of_the_week(Date),
    Day.

pick_hour(Line) ->
    Str = string:substr(Line, 3, 10),
    {Int, _} = string:to_integer(Str),
    {_, Time} = calendar:system_time_to_local_time(Int, 1),
    {Hour, _, _} = Time,
    Hour.

counts_map(List) ->
    lists:foldl(
        fun(X, Acc) -> maps:update_with(X, fun(V) -> V + 1 end, 1, Acc) end, #{}, List
    ).

top_commands(List) ->
    Commands = [pick_command(Line) || Line <- List, string:find(Line, "cd") == nomatch],
    CountsMap = counts_map(Commands),
    Sorted = lists:sort(fun({_, V1}, {_, V2}) -> V1 > V2 end, maps:to_list(CountsMap)),
    Top10 = lists:sublist(Sorted, 10),
    io:format("Counts: ~p~n", [Top10]).

contains_substring(String, Substring) ->
    lists:member(Substring, string:tokens(String, "")).

% 📂Top 10 directories
top_directories(List) ->
    Directories = [pick_directory(Line) || Line <- List, string:find(Line, "cd ") =/= nomatch],

    CountsMap = counts_map(Directories),
    Sorted = lists:sort(fun({_, V1}, {_, V2}) -> V1 > V2 end, maps:to_list(CountsMap)),
    Top10 = lists:sublist(Sorted, 10),
    io:format("Top 10 directories: ~p~n", [Top10]).

% 💦The busiest day
top_busiest_day(List) ->
    Dates = [pick_date(Line) || Line <- List],
    CountsMap = counts_map(Dates),
    Sorted = lists:sort(fun({_, V1}, {_, V2}) -> V1 > V2 end, maps:to_list(CountsMap)),
    Top1 = lists:sublist(Sorted, 1),
    io:format("The busiest day: ~p~n", [Top1]).

% 📅Weekly Activity
weekly_activity(List) ->
    Dates = [pick_weekday(Line) || Line <- List],
    CountsMap = counts_map(Dates),
    % TODO: percent based on max value
    io:format("Weekly Activity: ~p~n", [CountsMap]).

% 🕙Daily Activity
daily_activity(List) ->
    Dates = [pick_hour(Line) || Line <- List],
    CountsMap = counts_map(Dates),
    io:format("Daily Activity: ~p~n", [CountsMap]).

main() ->
    Histories = get_histories(),
    total(Histories),
    top_commands(Histories),
    top_directories(Histories),
    top_busiest_day(Histories),
    weekly_activity(Histories),
    daily_activity(Histories),
    ok.
