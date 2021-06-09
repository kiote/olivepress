defmodule Startegy.Weekly do
  @moduledoc """
  Simpliest strategy - buy every week.
  If today is _the day_ - Tuesday by default, gives an advice to buy,
  otherwise - skip.
  """
  @behaviour Strategy

  alias Startegy.Weekly.ParamsConverter

  defp day_to_buy do
    Application.get_env(:strategies, :weekly, weekday: :wed)
    |> Enum.into(%{})
    |> ParamsConverter.convert()
    |> Map.fetch!(:weekday)
  end

  @doc """
  Based on day of a week advice.
  Consider calling weekly-based strategies once per 24h
  otherwise you'd buy as many times as it is called
  """
  @impl true
  def advice(%{weekday: weekday}) when is_atom(weekday) do
    if weekday == day_to_buy() do
      {:buy, name()}
    else
      {:skip, name()}
    end
  end

  # Making sure that string parameters also workS
  def advice(params) do
    case ParamsConverter.convert(params) do
      %{weekday: weekday} = converted when is_atom(weekday) ->
        advice(converted)

      {:error, reason} ->
        {:error, {reason, name()}}
    end
  end

  @impl true
  def name do
    "weekly"
  end
end
