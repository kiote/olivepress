defmodule Strategy.WeeklyTest do
  use ExUnit.Case

  alias Startegy.Weekly

  test "suggests to buy when it's buying day" do
    assert {:buy, "weekly"} = Weekly.advice(%{weekday: :wed})
  end

  test "does not suggest to buy any other day" do
    assert {:skip, "weekly"} = Weekly.advice(%{weekday: :mon})
  end

  test "does not suggest to buy when no day specified" do
    assert {:error, _} = Weekly.advice(%{})
  end

  test "accepts string as a day name" do
    assert {:buy, "weekly"} = Weekly.advice(%{weekday: "Wed"})
  end

  test "accepts long string as a day name" do
    assert {:buy, "weekly"} = Weekly.advice(%{weekday: "WeDnesday"})
  end

  test "does not accept random string as a day name" do
    assert {:error, _} = Weekly.advice(%{weekday: "asdf"})
  end

  test "does not work with number as a day name" do
    assert {:error, _} = Weekly.advice(%{weekday: 1})
  end
end
