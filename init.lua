minetest.register_node("arabesquelite:lantern", {
        description = "Lantern",
        drawtype = "plantlike",
        tiles = {"arabesquelite_lantern.png"},
        paramtype = "light",
        light_source = LIGHT_MAX-1,
        is_ground_content = false,
        groups = {snappy = 3, oddly_breakable_by_hand = 3},
})

--nodes with stair plus support

local arabesquelite_nodes = {

      ["floral_obsidian_glass"] = {
		            description = "Floral Obsidian Glass",
		            drawtype = "glasslike_framed_optional",
		            tiles = {"arabesquelite_floral_obsidian_glass.png"},
		            paramtype = "light",
                is_ground_content = false,
		            sunlight_propagates = true,
		            groups = {cracky = 3, oddly_breakable_by_hand = 3},
		            sounds = default.node_sound_glass_defaults(),
      },

      ["desert_stone_knot"] = {
                description = "Desert Stone Knot",
                tiles = {"arabesquelite_desert_stone_knot.png"},
                groups = {cracky = 3},
                sounds = default.node_sound_stone_defaults(),
      },

      ["stone_knot"] = {
                description = "Stone Knot",
                tiles = {"arabesquelite_stone_knot.png"},
                groups = {cracky = 3},
                sounds = default.node_sound_stone_defaults(),
      },

      ["gold_knot"] = {
                description = "Gold Knot",
                tiles = {"arabesquelite_gold_knot.png"},
                groups = {cracky = 3},
                sounds = default.node_sound_stone_defaults(),
      },

      ["wood_knot"] = {
                description = "Wood Knot",
                tiles = {"arabesquelite_wood_knot.png"},
                groups = {choppy = 2},
                sounds = default.node_sound_wood_defaults(),
      },

      ["wood_panel"] = {
                description = "Wood Panel",
                tiles = {"arabesquelite_wood_panel.png"},
                groups = {choppy = 2},
                sounds = default.node_sound_stone_defaults(),
      },
}

for name, definition in pairs(arabesquelite_nodes) do
              minetest.register_node("arabesquelite:" .. name, definition)
end

--stairsplus (moreblocks) support
if minetest.get_modpath("moreblocks") ~= nil then
        for name, definition in pairs(arabesquelite_nodes) do
                stairsplus:register_all("stairs", name, "arabesquelite:"..name, {
                        description = name,
                              tiles = {"arabesquelite_"..name..".png"},
                              use_texture_alpha = true,
                              groups = {cracky = 3},
                              sounds = default.node_sound_stone_defaults()
        })
        end
--stairs support
elseif minetest.get_modpath("stairs") ~=nil then
        for name, definition in pairs(arabesquelite_nodes) do

              stairs.register_stair_and_slab(
                      name,
                      "arabesquelite:"..name,
                      {cracky = 3},
                      {"arabesquelite_"..name..".png"},
                      name.."Stair",
                      name.."Stair",
                      default.node_sound_stone_defaults()
                      )
        end
end



--crafts

minetest.register_craft({
        output = "arabesquelite:floral_obsidian_glass",
        recipe = {
              {"default:obsidian_shard", "default:obsidian_shard", "default:obsidian_shard"},
              {"default:obsidian_shard", "default:obsidian_glass", "default:obsidian_shard"},
              {"default:obsidian_shard", "default:obsidian_shard", "default:obsidian_shard"}
        }
})


minetest.register_craft({
        output = "arabesquelite:lantern 4",
        recipe = {
              {"", "default:iron_lump", ""},
              {"default:glass", "default:torch", "default:glass"},
              {"default:iron_lump", "default:iron_lump", "default:iron_lump"},
        }
})

minetest.register_craft({
        output = "arabesquelite:desert_stone_knot 9",
        recipe = {
              {"default:desert_stone", "default:sandstone", "default:desert_stone"},
              {"default:sandstone", "default:desert_stone", "default:sandstone"},
              {"default:desert_stone", "default:sandstone", "default:desert_stone"}
        }
})

minetest.register_craft({
        output = "arabesquelite:stone_knot 9",
        recipe = {
              {"default:stone", "default:obsidian", "default:stone"},
              {"default:obsidian", "default:stone", "default:obsidian"},
              {"default:stone", "default:obsidian", "default:stone"}
        }
})

minetest.register_craft({
        output = "arabesquelite:gold_knot 4",
        recipe = {
              {"default:gold_ingot", "default:stone", "default:gold_ingot"},
              {"default:stone", "dye:white", "default:stone"},
              {"default:gold_ingot", "default:stone", "default:gold_ingot"}
        }
})

minetest.register_craft({
        output = "arabesquelite:wood_knot 5",
        recipe = {
              {"default:wood", "", "default:wood"},
              {"", "default:wood", ""},
              {"default:wood", "", "default:wood"}
        }
})

minetest.register_craft({
        output = "arabesquelite:wood_panel 4",
        recipe = {
              {"", "", ""},
              {"default:wood", "default:wood", ""},
              {"default:wood", "default:wood", ""}
        }
})
