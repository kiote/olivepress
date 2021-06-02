defmodule Strategy do
  @moduledoc """
  Protocol for strategies
  """
  @type params() :: %{}
  @type strategy_name() :: String.t()
  @type reason() :: String.t()
  @type advice() ::
          {:buy, strategy_name()}
          | {:skip, strategy_name()}
          | {:error, {reason(), strategy_name()}}

  @callback advice(params()) :: advice()
  @callback name() :: strategy_name()
end
