defmodule Startegy.Weekly do
  @moduledoc """
  Simpliest strategy - buy every week.any()

  If today is _the day_ - Wednesday by default, gives an advice to buy,
  otherwise - skip.
  """
  @behaviour Strategy

  alias Startegy.Weekly.ParamsConverter

  @day_to_buy :wed

  @impl true
  def advice(%{weekday: weekday}) when is_atom(weekday) and weekday == @day_to_buy do
    {:buy, name()}
  end

  def advice(%{weekday: weekday}) when is_atom(weekday) do
    {:skip, name()}
  end

  def advice(params) do
    case ParamsConverter.convert(params) do
      %{weekday: weekday} = converted when is_atom(weekday) ->
        advice(converted)

      {:error, reason} ->
        {:error, {reason, name()}}
    end
  end

  @impl true
  def name() do
    "weekly"
  end
end
