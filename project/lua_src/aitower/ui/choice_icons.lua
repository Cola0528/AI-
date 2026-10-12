-- Match the actual upgrade effect ID, not words in a decorated description.
-- Related stats have different silhouettes so three choices can be scanned.
local M={}
M.upgrade={
 [1]='ReplaceableTextures\\CommandButtons\\BTNGauntletsOfOgrePower.blp', -- strength
 [2]='ReplaceableTextures\\CommandButtons\\BTNBootsOfSpeed.blp', -- agility
 [3]='ReplaceableTextures\\CommandButtons\\BTNMantleOfIntelligence.blp', -- intelligence
 [4]='ReplaceableTextures\\CommandButtons\\BTNDefend.blp', -- armor each turn
 [5]='ReplaceableTextures\\CommandButtons\\BTNPeriapt.blp', -- maximum health
 [6]='ReplaceableTextures\\CommandButtons\\BTNHumanArmorUpOne.blp', -- extra defense
 [7]='ReplaceableTextures\\CommandButtons\\BTNHelmOfValor.blp', -- all attributes
 [8]='ReplaceableTextures\\CommandButtons\\BTNChestOfGold.blp', -- immediate gold
 [9]='ReplaceableTextures\\CommandButtons\\BTNTransmute.blp', -- victory gold
 [10]='ReplaceableTextures\\CommandButtons\\BTNOrbOfLightning.blp', -- spell power
 [11]='ReplaceableTextures\\CommandButtons\\BTNStormBolt.blp', -- skill damage
 [12]='ReplaceableTextures\\CommandButtons\\BTNCriticalStrike.blp', -- critical chance
 [13]='ReplaceableTextures\\CommandButtons\\BTNArcaniteMelee.blp', -- critical damage
 [14]='ReplaceableTextures\\CommandButtons\\BTNPendantOfMana.blp', -- maximum mana
 [15]='ReplaceableTextures\\CommandButtons\\BTNTrueshot.blp', -- precise strike
 [16]='ReplaceableTextures\\CommandButtons\\BTNOrbOfFire.blp', -- final damage
 [17]='ReplaceableTextures\\CommandButtons\\BTNSteelMelee.blp', -- attack
}
function M.forUpgrade(S,dialog,slot)
 local button=S.LoadButtonHandle(S.HopeModern_Data,S.GetHandleId(dialog),200+slot)
 local kind=button and S.LoadInteger(S.YDHT,S.GetHandleId(button),0x0340FE72)or 0
 return M.upgrade[kind]
end
return M
