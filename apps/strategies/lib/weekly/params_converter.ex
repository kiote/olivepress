defmodule Startegy.Weekly.ParamsConverter do
  @moduledoc """
  Converts weekday from params
  Ex: Wednesday -> :wed
      weDNESDAY -> :wed etc
  """
  def convert(%{weekday: weekday}) when is_binary(weekday) do
    [:mon, :tue, :wed, :thu, :fri, :sat, :sun]

    try do
      to_atom = weekday |> String.downcase() |> String.slice(0..2) |> String.to_existing_atom()
      %{weekday: to_atom}
    rescue
      ArgumentError -> {:error, "Can not use #{weekday} as a weekday"}
    end
  end

  def convert(params) do
    if Map.has_key?(params, :weekday) do
      {:error, "unsupporting format for weekday: #{inspect(params.weekday)}"}
    else
      {:error, "Key :weekday is required in #{inspect(params)}"}
    end
  end
end
