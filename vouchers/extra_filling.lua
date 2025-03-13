SMODS.Voucher({
  key = 'extra_filling',
  atlas = 'Vouchers',
  pos = { x = 0, y = 0 },
  discovered = true,
  config = { extra = { booster_gain = 1 } },
  loc_vars = function(self, info_queue)
		return { vars = {} }
	end,
  redeem = function(self)
    if not G.GAME.extra_pocket_picks then
      G.GAME.extra_pocket_picks = 1
    else
      G.GAME.extra_pocket_picks = G.GAME.extra_pocket_picks + 1
    end
  end,
  unredeem = function(self)
    if not G.GAME.extra_pocket_picks then
      G.GAME.extra_pocket_picks = 0
    else
      G.GAME.extra_pocket_picks = G.GAME.extra_pocket_picks - 1
    end
  end
})
