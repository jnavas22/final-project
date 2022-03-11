class MembersController < ApplicationController
  def index 
    @list_of_members = User.all.order({ :first_name => :asc })

    render({ :template => "members/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_preferences = Preference.where({ :user_id => the_id }).order({ :created_at => :desc})

    @the_preference = matching_preferences.at(0)

    render({ :template => "members/show.html.erb" })
  end

  def another_index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

end