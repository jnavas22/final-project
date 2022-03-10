class MembersController < ApplicationController
  def index 
    #@q = User.ransack(params[:q])

    #@members = @q.result
    
    @list_of_members = User.all.order({ :first_name => :asc })

    render({ :template => "members/index.html.erb" })
    
  end
end