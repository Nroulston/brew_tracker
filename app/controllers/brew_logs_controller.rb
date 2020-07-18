class BrewLogsController < ApplicationController

  # don't need an index of all brew logs yet
  # get "/brew_logs" do
  #   erb :"/brew_logs/index.html"
  # end

  
  get "/brew_logs/new/:id" do
    if logged_in?
    set_recipe
    brew_log_creator
    redirect "brew_logs/#{@brew_log.id}"
    else
      redirect '/login'
    end
  end

  
  post "/brew_logs" do
    redirect "/brew_logs"
  end

  
  get "/brew_logs/:id" do
    set_brew_log 
    
    if current_user == @brew_log.user 
      erb :"/brew_logs/show.html"
    else
      redirect '/login'
    end
  end

  
  get "/brew_logs/:id/edit" do
    set_brew_log
    
    if current_user == @brew_log.user
     erb :"/brew_logs/edit.html"
    else
      redirect '/login'
    end
  end

  
  patch "/brew_logs/:id" do
    redirect "/brew_logs/:id"
  end

  
  delete "/brew_logs/:id/delete" do
    set_brew_log
    if current_user == @brew_log_user 
      @brew_log.destroy
      redirect "/brew_logs"
    else
      redirect '/login'
    end
  end


  helpers do
    
    def brew_log_creator
      @brew_log = current_user.brew_logs.build
      @brew_log.save
      @recipe.brew_logs << @brew_log
      
      @recipe.hops.each do |hop|
        @brew_log.hops << hop
      end

      @recipe.fermentables.each do |fermentable|
        @brew_log.fermentables << fermentable
      end

      @recipe.yeasts.each do |yeast|
        @brew_log.yeasts << yeast
      end

      @recipe.other_ingredients.each do |other_ingredient|
        @brew_log.other_ingredients << other_ingredient
      end
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
