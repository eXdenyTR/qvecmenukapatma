local silineceksekmeler = {
	language.GetPhrase("spawnmenu.category.npcs"), 
	language.GetPhrase("spawnmenu.category.entities"), 
	language.GetPhrase("spawnmenu.category.weapons"), 
	language.GetPhrase("spawnmenu.category.vehicles"), 
	language.GetPhrase("spawnmenu.category.postprocess"), 
	language.GetPhrase("spawnmenu.category.dupes"), 
	language.GetPhrase("spawnmenu.category.saves")
}

local izinverilenverilmeyenyetkililer = {
	["donator"] = true,
	["user"] = true,
	["mod"] = true,
	["mod+"] = true,
	["veteran-mod"] = true,
	["veteran-mod+"] = true,
	["admin"] = true,
	["admin+"] = true,
	["veteran-admin"] = true,
	["bilgin"] = true,
	["superadmin"] = false,
	["founder"] = false
}

local function sekmelerisil()
    if izinverilenverilmeyenyetkililer[LocalPlayer():GetUserGroup()] then
        for k, v in pairs( g_SpawnMenu.CreateMenu.Items ) do
            if table.HasValue(silineceksekmeler, v.Tab:GetText()) then
                g_SpawnMenu.CreateMenu:CloseTab( v.Tab, true )
                sekmelerisil()
            end
        end

        for k, v in pairs(g_SpawnMenu.ToolMenu.Items) do
            if v.Name=="#spawnmenu.utilities_tab" or v.Name=="Options" then
                g_SpawnMenu.ToolMenu:CloseTab(v.Tab, true)
                sekmelerisil()
            end
        end
    end    
end

hook.Add("SpawnMenuOpen", "sekmeleri_kaldir", sekmelerisil)