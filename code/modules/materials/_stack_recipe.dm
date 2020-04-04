/*
 * Recipe datum
 */
/datum/stack_recipe
	var/title = "ERROR"
	var/result_type
	var/req_amount = 1 // amount of material needed for this recipe
	var/res_amount = 1 // amount of stuff that is produced in one batch (e.g. 4 for floor tiles)
	var/max_res_amount = 1
	var/time = 0
	var/one_per_turf = 0
	var/on_floor = 0
	var/use_material
	var/use_reinf_material
	var/difficulty = 1 // higher difficulty requires higher skill level to make.
	var/apply_material_name = 1 //Whether the recipe will prepend a material name to the title - 'steel clipboard' vs 'clipboard'

/datum/stack_recipe/New(material/material, var/reinforce_material)
	if(material)
		use_material = material.type
		difficulty +=  material.construction_difficulty
	if(reinforce_material)
		use_reinf_material = reinforce_material
	SSfabrication.init_crafting_recipe(src)

#define CRAFTING_EXTRA_COST_FACTOR 1.2
/datum/stack_recipe/proc/InitializeMaterials()
	if(result_type && isnull(req_amount))
		req_amount = 0
		var/obj/I = spawn_result(null, null, res_amount)
		if(istype(I))
			var/list/building_cost = I.building_cost()
			for(var/path in building_cost)
				req_amount += building_cost[path]
			req_amount = Clamp(ceil((req_amount*CRAFTING_EXTRA_COST_FACTOR)/SHEET_MATERIAL_AMOUNT) * res_amount, 1, 50)
			if(!QDELETED(I))
				qdel(I)
#undef CRAFTING_EXTRA_COST_FACTOR

/datum/stack_recipe/proc/display_name()
	if(!use_material || !apply_material_name)
		return title
	. = "[material_display_name(use_material)] [title]"
	if(use_reinf_material)
		. = "[material_display_name(use_reinf_material)]-reinforced [.]"

/datum/stack_recipe/proc/spawn_result(mob/user, location, amount)
	var/atom/O
	if(use_material)
		//TODO: standardize material argument passing in Initialize().
		if(ispath(result_type, /obj/item/stack)) // Amount is set manually in some overrides as well.
			O = new result_type(location, amount, use_material, use_reinf_material)
		else
			O = new result_type(location, use_material, use_reinf_material)
	else
		O = new result_type(location)
	if(user)
		O.set_dir(user.dir)
	return O

/datum/stack_recipe/proc/can_make(mob/user)
	if (one_per_turf && (locate(result_type) in user.loc))
		to_chat(user, "<span class='warning'>There is another [display_name()] here!</span>")
		return FALSE

	var/turf/T = get_turf(user.loc)
	if (on_floor && !T.is_floor())
		to_chat(user, "<span class='warning'>\The [display_name()] must be constructed on the floor!</span>")
		return FALSE

	return TRUE

/*
 * Recipe list datum
 */
/datum/stack_recipe_list
	var/title = "ERROR"
	var/list/recipes = null

/datum/stack_recipe_list/New(title, recipes)
	src.title = title
	src.recipes = recipes 