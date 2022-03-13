class FinalRoommatesController < ApplicationController
  def index
    matching_final_roommates = FinalRoommate.all

    @list_of_final_roommates = matching_final_roommates.order({ :created_at => :desc })

    render({ :template => "final_roommates/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_final_roommates = FinalRoommate.where({ :id => the_id })

    @the_final_roommate = matching_final_roommates.at(0)

    render({ :template => "final_roommates/show.html.erb" })
  end

  def create
    the_final_roommate = FinalRoommate.new
    the_final_roommate.sender_id = params.fetch("query_sender_id")
    the_final_roommate.recipient_id = params.fetch("query_recipient_id")

    if the_final_roommate.valid?
      the_final_roommate.save
      redirect_to("/final_roommates", { :notice => "Final roommate created successfully." })
    else
      redirect_to("/final_roommates", { :notice => "Final roommate failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_final_roommate = FinalRoommate.where({ :id => the_id }).at(0)

    the_final_roommate.sender_id = params.fetch("query_sender_id")
    the_final_roommate.recipient_id = params.fetch("query_recipient_id")

    if the_final_roommate.valid?
      the_final_roommate.save
      redirect_to("/final_roommates/#{the_final_roommate.id}", { :notice => "Final roommate updated successfully."} )
    else
      redirect_to("/final_roommates/#{the_final_roommate.id}", { :alert => "Final roommate failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_final_roommate = FinalRoommate.where({ :id => the_id }).at(0)

    the_final_roommate.destroy

    redirect_to("/final_roommates", { :notice => "Final roommate deleted successfully."} )
  end
end
