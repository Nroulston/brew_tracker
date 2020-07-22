# frozen_string_literal: true

class BrewLogsController < ApplicationController
  use Rack::Flash
  get "/brew_logs" do

    erb :"/brew_logs/index.html"
  end

  get '/brew_logs/new/:id' do
    
    if logged_in?
      set_recipe
      brew_log_creator
      flash[:notice] = "BrewLog Created"
      redirect "brew_logs/#{@brew_log.id}"
    else
      flash[:error] = 'You must be logged in to start a BrewLog'
      redirect '/login'
    end
  end

  get '/brew_logs/:id' do
    set_brew_log
    if current_user == @brew_log.user
      erb :"/brew_logs/show.html"
    else
      flash[:error] = "You don't have access to that Brew Log. Sign in to your account to see it."
      redirect '/login'
    end
  end

  get '/brew_logs/:id/edit' do
    set_brew_log
    if current_user == @brew_log.user
      erb :"/brew_logs/edit.html"
    else
      flash[:error] = "You don't have access to that Brew Log. Sign in to your account to see it."
      redirect '/login'
    end
  end

  patch '/brew_logs/:id' do
    set_brew_log
    if current_user && @brew_log.update(params[:brew_log])

      update_existing_recipe_hop_records!
      add_new_hops_and_establish_recipe_hop_record!

      update_existing_recipe_fermentable_records!
      add_new_fermentable_and_establish_recipe_fermentable_record!

      update_existing_recipe_yeast_records!
      add_new_yeast_and_establish_recipe_yeast_record!

      update_existing_recipe_other_ingredient_records!
      add_new_other_ingredient_and_establish_recipe_other_ingredient_record!
      flash[:notice] = "Brew Log updated successfully "
      redirect "/brew_logs/#{@brew_log.id}"

    else
      flash[:error] = "You don't have access to that Brew Log. Sign in to your account to see it."
      erb :"/brew_logs/edit.html"
    end
  end

  delete '/brew_logs/:id/delete' do
    set_brew_log
    if current_user == @brew_log.user
      @brew_log.destroy
      flash[:notice] = "Brew Log deleted successfully "
      redirect '/brew_logs'
    else
      flash[:error] = "You don't have access to that Brew Log. Sign in to your account to see it."
      redirect '/login'
    end
  end

  helpers do
    def brew_log_creator
      recipe_dup = @recipe.dup
      @brew_log = current_user.brew_logs.build(recipe_dup.attributes)
      @brew_log.save
      @recipe.brew_logs << @brew_log


      @recipe.recipe_hops.each do |hop_record|
        hop_record_dup = hop_record.dup
        hop_record_dup.recipe = nil
        @brew_log.recipe_hops << hop_record_dup
      end

      @recipe.recipe_fermentables.each do |fermentable_record|
        fermentable_record_dup = fermentable_record.dup
        fermentable_record_dup.recipe = nil
        @brew_log.recipe_fermentables << fermentable_record_dup
      end

      @recipe.recipe_yeasts.each do |yeast_record|
        yeast_record_dup = yeast_record.dup
        yeast_record_dup.recipe = nil
        @brew_log.recipe_yeasts << yeast_record_dup
      end

      @recipe.recipe_other_ingredients.each do |other_ingredient_record|
        other_ingredient_record_dup = other_ingredient_record.dup
        other_ingredient_record_dup.recipe = nil
        @brew_log.recipe_other_ingredients << other_ingredient_record_dup
      end
    end

    # TODO: change the add to patch and change all references as well
    def add_time_measurement_and_measurement_quantity_to_join_table_record(join_table, index, ingredient)
      time, measurement, measurement_amount = make_or_find_time_measurement_measurement_amount_from_params(ingredient, index)
      # TODO: change the below into a method and include it in this method
      join_table.time_added = time
      join_table.measurement = measurement
      join_table.measurement_amount = measurement_amount
      join_table.save
    end

    def make_or_find_time_measurement_measurement_amount_from_params(ingredient, index)
      time = TimeAdded.find_or_create_by(time_added: params[ingredient][index][:time_added])
      measurement = Measurement.find_or_create_by(measurement: params[ingredient][index][:measurement])
      measurement_amount = MeasurementAmount.find_or_create_by(measurement_amount: params[ingredient][index][:measurement_amount])
      [time, measurement, measurement_amount]
    end

    def update_existing_recipe_hop_records!
      @hops_count = @brew_log.recipe_hops.count
      index = 0
      while index < @hops_count
        hop = Hop.find_or_create_by(name: params[:hop][index][:name], form: params[:hop][index][:form], alpha_acid: params[:hop][index][:alpha_acid])
        join_hop = @brew_log.recipe_hops[index]
        join_hop.hop = hop
        add_time_measurement_and_measurement_quantity_to_join_table_record(join_hop, index, :hop)
        index += 1
      end
    end

    def add_new_hops_and_establish_recipe_hop_record!
      index = @hops_count
      while index < params[:hop].count
        hop = Hop.find_or_create_by(name: params[:hop][index][:name], form: params[:hop][index][:form], alpha_acid: params[:hop][index][:alpha_acid])
        @brew_log.hops << hop
        join_hop = @brew_log.recipe_hops.last
        add_time_measurement_and_measurement_quantity_to_join_table_record(join_hop, index, :hop)
        index += 1
      end
    end

    def update_existing_recipe_fermentable_records!
      @fermentables_count = @brew_log.recipe_fermentables.count
      index = 0
      while index < @fermentables_count
        fermentable = Fermentable.find_or_create_by(name: params[:fermentable][index][:name])
        join_fermentable = @brew_log.recipe_fermentables[index]
        join_fermentable.fermentable = fermentable
        add_time_measurement_and_measurement_quantity_to_join_table_record(join_fermentable, index, :fermentable)
        index += 1
      end
    end

    def add_new_fermentable_and_establish_recipe_fermentable_record!
      index = @fermentables_count
      while index < params[:fermentable].count
        fermentable = Fermentable.find_or_create_by(name: params[:fermentable][index][:name])
        @brew_log.fermentables << fermentable
        join_fermentable = @brew_log.recipe_fermentables.last
        add_time_measurement_and_measurement_quantity_to_join_table_record(join_fermentable, index, :fermentable)
        index += 1
      end
    end

    def update_existing_recipe_yeast_records!
      @yeasts_count = @brew_log.recipe_yeasts.count
      index = 0
      while index < @yeasts_count
        yeast = Yeast.find_or_create_by(name: params[:yeast][index][:name])
        join_yeast = @brew_log.recipe_yeasts[index]
        join_yeast.yeast = yeast
        add_time_measurement_and_measurement_quantity_to_join_table_record(join_yeast, index, :yeast)
        index += 1
      end
    end

    def add_new_yeast_and_establish_recipe_yeast_record!
      index = @yeasts_count
      while index < params[:yeast].count
        yeast = Yeast.find_or_create_by(name: params[:yeast][index][:name])
        @brew_log.yeasts << yeast
        join_yeast = @brew_log.recipe_yeasts.last
        add_time_measurement_and_measurement_quantity_to_join_table_record(join_yeast, index, :yeast)
        index += 1
      end
    end

    def update_existing_recipe_other_ingredient_records!
      @other_ingredients_count = @brew_log.recipe_other_ingredients.count
      index = 0
      while index < @other_ingredients_count
        other_ingredient = OtherIngredient.find_or_create_by(name: params[:other_ingredient][index][:name])
        join_other_ingredient = @brew_log.recipe_other_ingredients[index]
        join_other_ingredient.other_ingredient = other_ingredient
        add_time_measurement_and_measurement_quantity_to_join_table_record(join_other_ingredient, index, :other_ingredient)
        index += 1
      end
    end

    def add_new_other_ingredient_and_establish_recipe_other_ingredient_record!
      index = @other_ingredients_count
      while index < params[:other_ingredient].count
        other_ingredient = OtherIngredient.find_or_create_by(name: params[:other_ingredient][index][:name])
        @brew_log.other_ingredients << other_ingredient
        join_other_ingredient = @brew_log.recipe_other_ingredients.last
        add_time_measurement_and_measurement_quantity_to_join_table_record(join_other_ingredient, index, :other_ingredient)
        index += 1
      end
    end
  end
end
