class MembersController < ApplicationController
  def index 
    #@q = User.ransack(params[:q])

    #@members = @q.result
    
    @list_of_members = User.all.order({ :first_name => :asc })

    render({ :template => "members/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_preferences = Preference.where({ :user_id => the_id })

    @the_preference = matching_preferences.at(0)

    render({ :template => "members/show.html.erb" })
  end

end