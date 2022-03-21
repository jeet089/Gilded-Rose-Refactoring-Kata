alias Item

defmodule GildedRoseHelpers do
  def age(%Item{} = item) do
    %Item{item | sell_in: item.sell_in - 1}
  end

  def degrade(%Item{} = item, rate) do
    %Item{item | quality: max(item.quality - rate, 0)}
  end

  def improve(%Item{} = item, rate) do
    %Item{item | quality: min(item.quality + rate, 50)}
  end

  def quality(%Item{} = item, quality) do
    %Item{item | quality: quality}
  end
end
