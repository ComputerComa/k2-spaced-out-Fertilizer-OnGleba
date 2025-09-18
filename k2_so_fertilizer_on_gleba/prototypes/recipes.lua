data:extend({

  {
    type = "recipe",
    name = "k2-so-fert-from-bioagents",
    category = "organic",
    energy_required = 30,
    icon = "__Krastorio2Assets__/icons/items/fertilizer.png",
    ingredients = 
    {
      {type="item", name="nutrients", amount=25},
      {type="item", name="jelly", amount=5},
      {type="item", name="yumako-mash", amount=5},
      {type="item", name="bioflux", amount=10},
      {type="fluid", name="water", amount=10}
    },
    results=
    {
      {type="item", name="kr-fertilizer", amount=5, probability=0.75},
      {type="item", name="spoilage", amount=20, probability=0.25}
    },

  }
  
})