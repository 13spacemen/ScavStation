/obj/item/gun/projectile/automatic/smg
	name = "submachine gun"
	desc = "The WT-550 Saber is a cheap self-defense weapon, mass-produced for paramilitary and private use."
	icon = 'icons/obj/guns/sec_smg.dmi'
	icon_state = "smg"
	item_state = "wt550"
	safety_icon = "safety"
	w_class = ITEM_SIZE_NORMAL
	caliber = CALIBER_PISTOL_SMALL
	origin_tech = "{'combat':5,'materials':2}"
	slot_flags = SLOT_BELT|SLOT_BACK
	ammo_type = /obj/item/ammo_casing/pistol/small
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/smg/rubber
	allowed_magazines = /obj/item/ammo_magazine/smg
	accuracy_power = 7
	one_hand_penalty = 3
	bulk = -1
	fire_sound = 'sound/weapons/gunshot/gunshot_smg.ogg'
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	material = MAT_STEEL
	matter = list(
		MAT_SILVER = MATTER_AMOUNT_REINFORCEMENT,
		MAT_DIAMOND = MATTER_AMOUNT_TRACE
	)

	//machine pistol, like SMG but easier to one-hand with
	firemodes = list(
		list(mode_name="semi auto",      burst=1, fire_delay=null, one_hand_penalty=3, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, one_hand_penalty=4, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",   burst=5, fire_delay=null, one_hand_penalty=5, burst_accuracy=list(0,-1,-1,-1,-2), dispersion=list(0.6, 0.6, 1.0, 1.0, 1.2)),
		list(mode_name="full auto",      can_autofire=1, burst=1, fire_delay=1, one_hand_penalty=7, burst_accuracy = list(0,-1,-1,-2,-2,-2,-3,-3), dispersion = list(1.0, 1.0, 1.0, 1.0, 1.2))
		)

/obj/item/gun/projectile/automatic/smg/on_update_icon()
	..()
	if(ammo_magazine)
		overlays += image(icon, "mag-[round(ammo_magazine.stored_ammo.len,5)]")
	if(ammo_magazine && LAZYLEN(ammo_magazine.stored_ammo))
		overlays += image(icon, "ammo-ok")
	else
		overlays += image(icon, "ammo-bad")

/obj/item/gun/projectile/automatic/assault_rifle
	name = "assault rifle"
	desc = "The Z8 Bulldog is an older model bullpup carbine. Makes you feel like a space marine when you hold it."
	icon = 'icons/obj/guns/bullpup_rifle.dmi'
	icon_state = "carbine"
	item_state = "z8carbine"
	w_class = ITEM_SIZE_HUGE
	force = 10
	caliber = CALIBER_RIFLE
	origin_tech = "{'combat':8,'materials':3}"
	ammo_type = /obj/item/ammo_casing/rifle
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/rifle
	allowed_magazines = /obj/item/ammo_magazine/rifle
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	accuracy = 2
	accuracy_power = 7
	one_hand_penalty = 8
	bulk = GUN_BULK_RIFLE
	burst_delay = 1
	wielded_item_state = "z8carbine-wielded"
	mag_insert_sound = 'sound/weapons/guns/interaction/batrifle_magin.ogg'
	mag_remove_sound = 'sound/weapons/guns/interaction/batrifle_magout.ogg'
	material = MAT_STEEL
	matter = list(
		MAT_SILVER = MATTER_AMOUNT_REINFORCEMENT,
		MAT_DIAMOND = MATTER_AMOUNT_TRACE
	)
	firemodes = list(
		list(mode_name="semi auto",      burst=1,    fire_delay=null, use_launcher=null, one_hand_penalty=8,  burst_accuracy=null,          dispersion=null),
		list(mode_name="3-round bursts", burst=3,    fire_delay=null, use_launcher=null, one_hand_penalty=9,  burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="fire grenades",  burst=null, fire_delay=null, use_launcher=1,    one_hand_penalty=10, burst_accuracy=null,          dispersion=null)
	)

	var/use_launcher = 0
	var/obj/item/gun/launcher/grenade/underslung/launcher

/obj/item/gun/projectile/automatic/assault_rifle/Initialize()
	. = ..()
	launcher = new(src)

/obj/item/gun/projectile/automatic/assault_rifle/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/grenade)))
		launcher.load(I, user)
	else
		..()

/obj/item/gun/projectile/automatic/assault_rifle/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/gun/projectile/automatic/assault_rifle/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/gun/projectile/automatic/assault_rifle/on_update_icon()
	..()
	if(ammo_magazine)
		if(ammo_magazine.stored_ammo.len)
			icon_state = "carbine-loaded"
		else
			icon_state = "carbine-empty"
	else
		icon_state = "carbine"

/obj/item/gun/projectile/automatic/assault_rifle/examine(mob/user)
	. = ..()
	if(launcher.chambered)
		to_chat(user, "\The [launcher] has \a [launcher.chambered] loaded.")
	else
		to_chat(user, "\The [launcher] is empty.")
