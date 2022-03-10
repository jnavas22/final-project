class PreferencesController < ApplicationController
  def index
    matching_preferences = Preference.all

    @list_of_preferences = matching_preferences.order({ :created_at => :desc })

    render({ :template => "preferences/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_preferences = Preference.where({ :id => the_id })

    @the_preference = matching_preferences.at(0)

    render({ :template => "preferences/show.html.erb" })
  end

  def create
    @the_preference = Preference.new
    @the_preference.user_id = @current_user.id
    @the_preference.pets = params.fetch("query_pets", false)
    @the_preference.max_rent = params.fetch("query_max_rent")
    @the_preference.person_type = params.fetch("query_person_type")
    @the_preference.laundry = params.fetch("query_laundry", false)
    @the_preference.doorman = params.fetch("query_doorman", false)
    @the_preference.roommate_num = params.fetch("query_roommate_num")
    @the_preference.smoker = params.fetch("query_smoker", false)
    @the_preference.bathroom_num = params.fetch("query_bathroom_num")
    @the_preference.elevator = params.fetch("query_elevator", false)
    @the_preference.transportation = params.fetch("query_transportation", false)
    @the_preference.air_conditioner = params.fetch("query_air_conditioner", false)

    if @the_preference.valid?
      @the_preference.save
      redirect_to("/preferences", { :notice => "Great! Your preferences were created successfully." })
    else
      redirect_to("/preferences", { :notice => "Preference failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_preference = Preference.where({ :id => the_id }).at(0)

    the_preference.user_id = @current_user.id
    the_preference.pets = params.fetch("query_pets", false)
    the_preference.max_rent = params.fetch("query_max_rent")
    the_preference.person_type = params.fetch("query_person_type")
    the_preference.laundry = params.fetch("query_laundry", false)
    the_preference.doorman = params.fetch("query_doorman", false)
    the_preference.roommate_num = params.fetch("query_roommate_num")
    the_preference.smoker = params.fetch("query_smoker")
    the_preference.bathroom_num = params.fetch("query_bathroom_num")
    the_preference.elevator = params.fetch("query_elevator", false)
    the_preference.transportation = params.fetch("query_transportation", false)
    the_preference.air_conditioner = params.fetch("query_air_conditioner", false)

    if the_preference.valid?
      the_preference.save
      redirect_to("/preferences/#{the_preference.id}", { :notice => "Preference updated successfully."} )
    else
      redirect_to("/preferences/#{the_preference.id}", { :alert => "Preference failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_preference = Preference.where({ :id => the_id }).at(0)

    the_preference.destroy

    redirect_to("/preferences", { :notice => "Preference deleted successfully."} )
  end
end
