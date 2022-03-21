import GildedRoseHelpers
import Item
alias GildedRoseHelpers
alias Item

defmodule GildedRose do
  @item_names %{
    back_stage: "Backstage passes to a TAFKAL80ETC concert",
    aged_bread: "Aged Brie",
    sulfuras: "Sulfuras, Hand of Ragnaros",
    conjured_mana: "Conjured Mana Cake"
  }

  def update_quality(items) do
    Enum.map(items, &update/1)
  end

  def update(%Item{name: name, sell_in: sell_in} = item) do
    cond do
      name == @item_names.aged_bread ->
        update_aged_bread(item, sell_in)

      name == @item_names.back_stage ->
        update_back_stage(item, sell_in)

      name == @item_names.conjured_mana ->
        update_conjured(item, sell_in)

      name == @item_names.sulfuras ->
        item |> quality(80)

      true ->
        different_case(item, sell_in)
    end
  end

  def update_back_stage(item, sell_in) do
    cond do
      sell_in <= 0 ->
        item |> age() |> quality(0)

      sell_in <= 5 ->
        item |> age() |> improve(3)

      sell_in <= 10 ->
        item |> age() |> improve(2)

      true ->
        item |> age() |> improve(1)
    end
  end

  def update_aged_bread(item, sell_in) do
    value = if sell_in <= 0, do: 2, else: 1
    item |> age() |> improve(value)
  end

  def update_conjured(item, sell_in) do
    value = if sell_in <= 0, do: 4, else: 2
    item |> age() |> degrade(value)
  end

  def different_case(item, sell_in) do
    value = if sell_in <= 0, do: 2, else: 1
    item |> age() |> degrade(value)
  end
end
