SMODS.Voucher({
  key = 'wholesale',
  atlas = 'Vouchers',
  pos = { x = 0, y = 1 },
  discovered = true,
  requires = { "v_hands_extra_filling" },
  config = { extra = { booster_gain = 1 } },
  redeem = function(self)
    G.GAME.modifiers.hnds_boosters = (G.GAME.modifiers.hnds_boosters or 0) + self.config.extra.booster_gain
    if G.shop_booster then HNDS.spawn_booster() end
  end
})
