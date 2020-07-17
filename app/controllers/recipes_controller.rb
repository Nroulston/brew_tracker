class RecipesController < ApplicationController

  get "/recipes" do
    erb :"/recipes/index.html"
  end

  get "/recipes/new" do
    erb :"/recipes/new.html"
  end

  post "/recipes" do
  #create a new recipe
  @recipe = Recipe.new(params[:recipe])
  @recipe.save
  
  # Todo If you figure out jquery creation of form inputs then you need to change below to an each do block to create find or create each ingredient.
 
  # Todo potentially use .send to make Hop.find_or_create_by dynamic for all ingredients def set_property(obj, prop_name, prop_value) obj.send("#{prop_name}=",prop_value) end potentially use hashes build out an attr accessor with hash of ingredients with classname, params accessors, join_tables, basically all things that might be variable per ingredient. This would allow you to make only one change to the ingredients hash to make changes to the entire process. 
  
  
  params[:hop].each.with_index do |hop_details, index|
    hop_instance = Hop.find_or_create_by(name: hop_details[:name], form: hop_details[:form], alpha_acid: hop_details[:alpha_acid])
    @recipe.hops << hop_instance 
    join_hop = @recipe.recipe_hops.last
    add_time_measurement_and_measurement_quantity_to_join_table_record(join_hop, index, :hop )
  end

  params[:fermentable].each.with_index do |grain_details, index|
    fermentable = Fermentable.find_or_create_by(name: grain_details[:name])
    @recipe.fermentables << fermentable
    join_fermentable = @recipe.recipe_fermentables.last
    add_time_measurement_and_measurement_quantity_to_join_table_record(join_fermentable, index, :fermentable)
  end
  
  params[:yeast].each.with_index do |yeast_details, index|
    yeast = Yeast.find_or_create_by(name: yeast_details[:name])
    @recipe.yeasts << yeast
    join_yeast = @recipe.recipe_yeasts.last
    add_time_measurement_and_measurement_quantity_to_join_table_record(join_yeast, index, :yeast)
  end

  params[:other_ingredient].each.with_index do |ingredient_details, index|
    other_ingredient = OtherIngredient.find_or_create_by(name: params[:other_ingredient][0][:name])
    @recipe.other_ingredients << other_ingredient
    join_other_ingredient = @recipe.recipe_other_ingredients.last
    add_time_measurement_and_measurement_quantity_to_join_table_record(join_other_ingredient, index,:other_ingredient)
  end


  
  redirect "/recipes"
end

get "/recipes/:id" do
  set_recipe

  erb :"/recipes/show.html"
end

get "/recipes/:id/edit" do
  set_recipe
  
  erb :"/recipes/edit.html"
end

patch "/recipes/:id" do
  #Todo look up how to not run the next lines of code of the form submitted has no changes from it's initial value, or how to not run it for items that had no changes. Example hops didn't change at all, but extra ingredients changed the time they were added. 

  #todo need to test if when editing a recipe with no hops that there is a recipe_hops join table that can be accessed before adding the new hop to the association.
  
  set_recipe
  @recipe.update(params[:recipe])
  
  update_existing_recipe_hop_records!
  add_new_hops_and_establish_recipe_hop_record!

  update_existing_recipe_fermentable_records!
  add_new_fermentable_and_establish_recipe_fermentable_record!

  update_existing_recipe_yeast_records!
  add_new_yeast_and_establish_recipe_yeast_record!

  update_existing_recipe_other_ingredient_records!
  add_new_other_ingredient_and_establish_recipe_other_ingredient_record!
  redirect "/recipes/#{@recipe.id}"
end

delete "/recipes/:id/delete" do
  redirect "/recipes"
end

  helpers do

    def set_recipe
      @recipe = Recipe.find_by_id(params[:id])
    end

    def add_time_measurement_and_measurement_quantity_to_join_table_record(join_table, index, ingredient )
      time, measurement, measurement_amount = make_or_find_time_measurement_measurement_amount_from_params(ingredient, index)
      join_table.time_added = time
      join_table.measurement = measurement
      join_table.measurement_amount = measurement_amount
      join_table.save
    end

    def make_or_find_time_measurement_measurement_amount_from_params(ingredient, index)
      time = TimeAdded.find_or_create_by(time_added: params[ingredient][index][:time_added])
      measurement = Measurement.find_or_create_by(measurement: params[ingredient][index][:measurement])
      measurement_amount = MeasurementAmount.find_or_create_by(measurement_amount: params[ingredient][index][:measurement_amount])
      return time,measurement,measurement_amount
    end

    def update_existing_recipe_hop_records! 
      @hops_count = @recipe.recipe_hops.count
      index = 0
      while index < @hops_count
        hop = Hop.find_or_create_by(name: params[:hop][index][:name], form: params[:hop][index][:form], alpha_acid: params[:hop][index][:alpha_acid])
        join_hop = @recipe.recipe_hops[index]
        join_hop.hop = hop
        add_time_measurement_and_measurement_quantity_to_join_table_record(join_hop, index, :hop)
        index += 1
      end
    end
    def add_new_hops_and_establish_recipe_hop_record!
      index = @hops_count
      while index < params[:hop].count
        hop = Hop.find_or_create_by(name: params[:hop][index][:name], form: params[:hop][index][:form], alpha_acid: params[:hop][index][:alpha_acid])
        @recipe.hops << hop
        join_hop = @recipe.recipe_hops.last
        add_time_measurement_and_measurement_quantity_to_join_table_record(join_hop, index, :hop)
        index += 1
      end
    end

    def update_existing_recipe_fermentable_records! 
      @fermentables_count = @recipe.recipe_fermentables.count
      index = 0
      while index < @fermentables_count
        fermentable = Fermentable.find_or_create_by(name: params[:fermentable][index][:name])
        join_fermentable = @recipe.recipe_fermentables[index]
        join_fermentable.fermentable = fermentable
        add_time_measurement_and_measurement_quantity_to_join_table_record(join_fermentable, index, :fermentable)
        index += 1
      end
    end
    def add_new_fermentable_and_establish_recipe_fermentable_record!
      index = @fermentables_count
      while index < params[:fermentable].count
        fermentable = Fermentable.find_or_create_by(name: params[:fermentable][index][:name])
        @recipe.fermentables << fermentable
        join_fermentable = @recipe.recipe_fermentables.last
        add_time_measurement_and_measurement_quantity_to_join_table_record(join_fermentable, index, :fermentable)
        index += 1
      end
    end
    def update_existing_recipe_yeast_records! 
      @yeasts_count = @recipe.recipe_yeasts.count
      index = 0
      while index < @yeasts_count
        yeast = Yeast.find_or_create_by(name: params[:yeast][index][:name])
        join_yeast = @recipe.recipe_yeasts[index]
        join_yeast.yeast = yeast
        add_time_measurement_and_measurement_quantity_to_join_table_record(join_yeast, index, :yeast)
        index += 1
      end
    end
    def add_new_yeast_and_establish_recipe_yeast_record!
      index = @yeasts_count
      while index < params[:yeast].count
        yeast = Yeast.find_or_create_by(name: params[:yeast][index][:name])
        @recipe.yeasts << yeast
        join_yeast = @recipe.recipe_yeasts.last
        add_time_measurement_and_measurement_quantity_to_join_table_record(join_yeast, index, :yeast)
        index += 1
      end
    end
    def update_existing_recipe_other_ingredient_records! 
      @other_ingredients_count = @recipe.recipe_other_ingredients.count
      index = 0
      while index < @other_ingredients_count
        other_ingredient = OtherIngredient.find_or_create_by(name: params[:other_ingredient][index][:name])
        join_other_ingredient = @recipe.recipe_other_ingredients[index]
        join_other_ingredient.other_ingredient = other_ingredient
        add_time_measurement_and_measurement_quantity_to_join_table_record(join_other_ingredient, index, :other_ingredient)
        index += 1
      end
    end
    def add_new_other_ingredient_and_establish_recipe_other_ingredient_record!
      index = @other_ingredients_count
      while index < params[:other_ingredient].count
        other_ingredient = OtherIngredient.find_or_create_by(name: params[:other_ingredient][index][:name])
        @recipe.other_ingredients << other_ingredient
        join_other_ingredient = @recipe.recipe_other_ingredients.last
        add_time_measurement_and_measurement_quantity_to_join_table_record(join_other_ingredient, index, :other_ingredient)
        index += 1
      end
    end
  end
end