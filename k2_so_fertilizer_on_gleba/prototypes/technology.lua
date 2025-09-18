data:extend({
    {
        type = "technology",
        name = "k2-so-fert-on-gleba",
        icon = "__Krastorio2Assets__/icons/items/fertilizer.png",
        icon_size = 256,
        prerequisites = {"kr-bio-processing", "bioflux"},
        effects = {
            {
                type = "unlock-recipe",
                recipe = "fertilizer-from-bioagents"
            }
        },
        research_trigger = {
            type = "craft-item",
            item = "bioflux",
            count = 500
        }
    }

    })