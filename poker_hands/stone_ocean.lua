SMODS.PokerHand {
  key = "stone_ocean",
  name = "Stone Ocean",
  above_hand = "Two Pair",
  loc_txt = {
    name = "Stone Ocean",
    description = {
        "A hand consisting of 5 Stone cards"
    }
},
  visible = false,
  chips = 50,
  mult = 1,
  l_chips = 10,
  l_mult = 0,
  example = {
    { "S_2", true, "m_stone" },
    { "S_2", true, "m_stone" },
    { "S_2", true, "m_stone" },
    { "S_2", true, "m_stone" },
    { "S_2", true, "m_stone" }
  },
  evaluate = function(parts)
    return parts.hnds_so_base
  end,
}

SMODS.PokerHandPart {
  key = 'so_base',
  func = function(hand)
    if #hand < 5 then return {} end
    local ret = {}
    local stones = 0
    for i = 1, #hand do
      local v = hand[i].base.value
      -- Skip anything we can't interpret (for whatever reason)
      if v then
        if hand[i].ability.name == "Stone Card" and not hand[i]:is_face() and stones < 5 then
          stones = stones + 1
          table.insert(ret, hand[i])
        end
      end
    end
    if stones >= 5 and #ret >= 5 then
      return { ret }
    else
      return {}
    end
  end
}
