/datum/unit_test/station_wires_shall_be_connected
	exceptions = list(list(48, 54, 3, EAST))

/datum/map/tradeship
	// Unit test exemptions
	apc_test_exempt_areas = list(
		/area/turbolift = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/space = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/exoplanet = NO_SCRUBBER|NO_VENT|NO_APC,
		/area/ship/scrap/maintenance/engine/port = NO_SCRUBBER|NO_VENT,
		/area/ship/scrap/maintenance/engine/starboard = NO_SCRUBBER|NO_VENT,
		/area/ship/scrap/crew/hallway/port = NO_SCRUBBER|NO_VENT,
		/area/ship/scrap/crew/hallway/starboard = NO_SCRUBBER|NO_VENT,
		/area/ship/scrap/maintenance/hallway = NO_SCRUBBER|NO_VENT,
		/area/ship/scrap/maintenance/lower = NO_SCRUBBER|NO_VENT,
		/area/ship/scrap/command/hallway = NO_SCRUBBER|NO_VENT,
		/area/ship/scrap/escape_port = NO_SCRUBBER|NO_VENT,
		/area/ship/scrap/escape_star = NO_SCRUBBER|NO_VENT,
		/area/ship/scrap/shuttle/outgoing = NO_SCRUBBER,
		/area/ship/scrap/maintenance/atmos = NO_SCRUBBER
	)

