
/obj/item/stock_parts/circuitboard/forensic
	name = T_BOARD("forensic omnianalyzer")
	build_path = /obj/machinery/forensic
	board_type = "machine"
	origin_tech = "{'" + TECH_DATA + "':6,'" + TECH_ENGINEERING + "':6,'" + TECH_BIO + "':6}"
	req_components = list(
							/obj/item/stock_parts/scanning_module = 1,
							/obj/item/stock_parts/manipulator = 1,
							/obj/item/stock_parts/micro_laser = 1)
	additional_spawn_components = list(
		/obj/item/stock_parts/power/apc/buildable = 1
	)

/obj/item/stock_parts/circuitboard/forensic_microscope
	name = T_BOARD("forensic microscope")
	board_type = "machine"
	origin_tech = "{'" + TECH_DATA + "':3,'" + TECH_ENGINEERING + "':3,'" + TECH_BIO + "':3}"
	build_path = /obj/machinery/forensic/microscope
	req_components = list(
							/obj/item/stock_parts/scanning_module = 1,
							)
	additional_spawn_components = list(
		/obj/item/stock_parts/power/apc/buildable = 1
	)

/obj/item/stock_parts/circuitboard/forensic_dna_analyzer
	name = T_BOARD("forensic DNA analyzer")
	board_type = "machine"
	origin_tech = "{'" + TECH_DATA + "':3,'" + TECH_ENGINEERING + "':3,'" + TECH_BIO + "':3}"
	req_components = list(
							/obj/item/stock_parts/scanning_module = 1,
							/obj/item/stock_parts/manipulator = 1,
							/obj/item/stock_parts/micro_laser = 1)
	build_path = /obj/machinery/forensic/dnascanner
	additional_spawn_components = list(
		/obj/item/stock_parts/keyboard = 1,
		/obj/item/stock_parts/console_screen = 1,
		/obj/item/stock_parts/power/apc/buildable = 1
	)