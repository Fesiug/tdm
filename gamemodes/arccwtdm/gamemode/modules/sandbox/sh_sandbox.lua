hook.Add("PlayerCheckLimit", "ArcCWTDM_PlayerCheckLimit", function(ply, name, cur, max)
    -- This disables spawning or using anything else
    if not ply:IsAdmin() and GetConVar("tdm_spawn"):GetBool() == false then return false end
end)

hook.Add("PlayerGiveSWEP", "BlockPlayerSWEPs", function(ply, class, swep)
    -- Check if they're based on ArcCW or ARC9 here
    if weapons.IsBasedOn(class, "arccw_base") or weapons.IsBasedOn(class, "arccw_base_melee") or weapons.IsBasedOn(class, "arccw_base_nade") or weapons.IsBasedOn(class, "arccw_uo_grenade_base") or weapons.IsBasedOn(class, "arc9_base") then return true end
    -- Otherwise, no
    if not ply:IsAdmin() and GetConVar("tdm_spawn"):GetBool() == false then return false end
end)

function GM:PlayerNoClip(pl, on)
    -- Admin check this
    if not on then return true end
    -- Allow noclip if we're in single player and living

    return IsValid(pl) and pl:Alive() and pl:IsAdmin()
end