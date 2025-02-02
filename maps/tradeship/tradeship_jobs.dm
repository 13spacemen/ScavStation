/decl/department/exploration
	name = "Exploration"
	announce_channel = "Exploration"
	colour = "#68099e"
	display_color = "#b784a7"

/datum/map/tradeship
	default_job_type = /datum/job/tradeship_deckhand
	default_department_type = /decl/department/civilian
	default_law_type = /datum/ai_laws/corporate
	id_hud_icons = 'maps/tradeship/hud.dmi'
	allowed_jobs = list(
		/datum/job/tradeship_deckhand,
		/datum/job/tradeship_captain,
		/datum/job/tradeship_first_mate,
		/datum/job/tradeship_doctor/head,
		/datum/job/tradeship_doctor,
		/datum/job/tradeship_engineer/head,
		/datum/job/tradeship_engineer,
		/datum/job/tradeship_researcher/head,
		/datum/job/tradeship_researcher,
		/datum/job/tradeship_robot,
		/datum/job/yinglet/worker,
		/datum/job/yinglet/scout,
		/datum/job/yinglet/patriarch,
		/datum/job/yinglet/matriarch
	)
	species_to_job_whitelist = list(
		/decl/species/indrel = list(
			/datum/job/tradeship_robot,
			/datum/job/tradeship_deckhand,
			/datum/job/tradeship_engineer,
			/datum/job/tradeship_engineer/head
		),
		/decl/species/baxxid = list(
			/datum/job/tradeship_robot,
			/datum/job/tradeship_deckhand,
			/datum/job/tradeship_first_mate,
			/datum/job/tradeship_researcher,
			/datum/job/tradeship_researcher/head,
			/datum/job/tradeship_captain
		),
		/decl/species/yinglet = list(
			/datum/job/yinglet/worker,
			/datum/job/yinglet/scout,
			/datum/job/yinglet/patriarch,
			/datum/job/yinglet/matriarch,
			/datum/job/tradeship_deckhand,
			/datum/job/tradeship_engineer,
			/datum/job/tradeship_robot,
			/datum/job/tradeship_doctor,
			/datum/job/tradeship_researcher
		)
	)

/obj/machinery/suit_cycler/tradeship
	boots = /obj/item/clothing/shoes/magboots
	req_access = list()
	initial_access = list()
	locked = FALSE

/obj/machinery/suit_cycler/tradeship/Initialize()
	if(prob(75))
		suit = pick(list(
			/obj/item/clothing/suit/space/void/mining,
			/obj/item/clothing/suit/space/void/engineering,
			/obj/item/clothing/suit/space/void/pilot,
			/obj/item/clothing/suit/space/void/excavation,
			/obj/item/clothing/suit/space/void/engineering/salvage
		))
	if(prob(75))
		helmet = pick(list(
			/obj/item/clothing/head/helmet/space/void/mining,
			/obj/item/clothing/head/helmet/space/void/engineering,
			/obj/item/clothing/head/helmet/space/void/pilot,
			/obj/item/clothing/head/helmet/space/void/excavation,
			/obj/item/clothing/head/helmet/space/void/engineering/salvage
		))
	. = ..()
