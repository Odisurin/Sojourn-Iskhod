/obj/screen/item_action/top_bar/gun
	icon = 'icons/mob/screen/gun_actions.dmi'
	screen_loc = "8,1:13"
	minloc = "7,2:13"

/obj/screen/item_action/top_bar/gun/safety
	name = "safety"
	icon_state = "safety1"
	ErisOptimized_minloc = "8,1.35"

/obj/screen/item_action/top_bar/gun/safety/update_icon()
	..()
	var/obj/item/gun/G = owner
	icon_state = "safety[G.safety]"


/obj/screen/item_action/top_bar/gun/fire_mode
	name = "fire mode"
	icon_state = "mode_semi"
	ErisOptimized_minloc = "8,1.35"

/obj/screen/item_action/top_bar/gun/fire_mode/update_icon()
	..()
	var/obj/item/gun/G = owner
	if(G.sel_mode <= length(G.firemodes))
		var/datum/firemode/cur_mode = G.firemodes[G.sel_mode]
		icon_state = "mode_[cur_mode.icon_state]"


/obj/screen/item_action/top_bar/gun/scope
	name = "scope"
	icon_state = "scope0"
	screen_loc = "9,1:13"
	minloc = "8,2:13"
	ErisOptimized_minloc = "9,1.35"

/obj/screen/item_action/top_bar/gun/scope/update_icon()
	..()
	var/obj/item/gun/G = owner
	if(G)
		icon_state = "scope[G.zoom]"

/obj/screen/item_action/top_bar/weapon_info
	icon = 'icons/mob/screen/gun_actions.dmi'
	screen_loc = "9:16,1:13"
	minloc = null
	name = "Weapon Info"
	icon_state = "info"
	ErisOptimized_minloc = "16.5,10.3"

/obj/item/gun/ui_action_click(mob/living/user, action_name)
	switch(action_name)
		if("fire mode")
			toggle_firemode(user)
		if("scope")
			toggle_scope(user)
		if("safety")
			toggle_safety(user)
		if("Weapon Info")
			ui_interact(user)
