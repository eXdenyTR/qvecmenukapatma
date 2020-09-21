hook.Add("ContextMenuOpen", "SuperAdminContext", function()

    if not LocalPlayer():IsSuperAdmin() then return false end

end)