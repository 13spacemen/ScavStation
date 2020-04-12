// For wall machines, using the wall frame construction method.

/obj/item/stock_parts/circuitboard/fire_alarm
	name = T_BOARD("fire alarm")
	icon = 'icons/obj/doors/door_assembly.dmi'
	icon_state = "door_electronics"
	desc = "A circuit. It has a label on it, it says \"Can handle heat levels up to 40 degrees celsius!\"."
	build_path = /obj/machinery/firealarm
	board_type = "wall"
	origin_tech = "{'" + TECH_DATA + "':1,'" + TECH_ENGINEERING + "':1}"
	req_components = list()
	additional_spawn_components = list(
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/keyboard = 1,
		/obj/item/stock_parts/power/apc/buildable = 1
	)

/obj/item/stock_parts/circuitboard/air_alarm
	name = T_BOARD("air alarm")
	icon = 'icons/obj/doors/door_assembly.dmi'
	icon_state = "door_electronics"
	build_path = /obj/machinery/alarm
	board_type = "wall"
	origin_tech = "{'" + TECH_DATA + "':1,'" + TECH_ENGINEERING + "':1}"
	req_components = list()
	additional_spawn_components = list(
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/keyboard = 1,
		/obj/item/stock_parts/power/apc/buildable = 1
	)

/obj/item/stock_parts/circuitboard/apc
	name = T_BOARD("area power controller")
	desc = "Heavy-duty switching circuits for power control."
	icon = 'icons/obj/module.dmi'
	icon_state = "power_mod"
	item_state = "electronic"
	matter = list(MAT_STEEL = 50, MAT_GLASS = 50)
	w_class = ITEM_SIZE_SMALL
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	build_path = /obj/machinery/power/apc/buildable
	board_type = "wall"
	origin_tech = "{'" + TECH_DATA + "':1,'" + TECH_ENGINEERING + "':1}"
	req_components = list()
	additional_spawn_components = list(
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/keyboard = 1,
		/obj/item/stock_parts/power/battery/buildable = 1,
		/obj/item/stock_parts/power/terminal/buildable = 1,
		/obj/item/stock_parts/access_lock/buildable = 1
	)

/obj/item/stock_parts/circuitboard/requests_console
	name = T_BOARD("requests console")
	build_path = /obj/machinery/requests_console
	board_type = "wall"
	origin_tech = "{'" + TECH_DATA + "':1,'" + TECH_ENGINEERING + "':1}"
	req_components = list()
	additional_spawn_components = list(
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/keyboard = 1,
		/obj/item/stock_parts/power/apc/buildable = 1,
	)

/obj/item/stock_parts/circuitboard/requests_console/atm
	name = T_BOARD("atm")
	build_path = /obj/machinery/atm

/obj/item/stock_parts/circuitboard/requests_console/newscaster
	name = T_BOARD("newscaster")
	build_path = /obj/machinery/newscaster