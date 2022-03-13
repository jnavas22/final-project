class ReceivedRoommateRequestsController < ApplicationController
  def index
    matching_received_roommate_requests = ReceivedRoommateRequest.all

    @list_of_received_roommate_requests = matching_received_roommate_requests.order({ :created_at => :desc })

    render({ :template => "received_roommate_requests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_received_roommate_requests = ReceivedRoommateRequest.where({ :id => the_id })

    @the_received_roommate_request = matching_received_roommate_requests.at(0)

    render({ :template => "received_roommate_requests/show.html.erb" })
  end

  def create
    the_received_roommate_request = ReceivedRoommateRequest.new
    the_received_roommate_request.sender_id = params.fetch("query_sender_id")
    the_received_roommate_request.recipient_id = params.fetch("query_recipient_id")

    if the_received_roommate_request.valid?
      the_received_roommate_request.save
      redirect_to("/received_roommate_requests", { :notice => "Received roommate request created successfully." })
    else
      redirect_to("/received_roommate_requests", { :notice => "Received roommate request failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_received_roommate_request = ReceivedRoommateRequest.where({ :id => the_id }).at(0)

    the_received_roommate_request.sender_id = params.fetch("query_sender_id")
    the_received_roommate_request.recipient_id = params.fetch("query_recipient_id")

    if the_received_roommate_request.valid?
      the_received_roommate_request.save
      redirect_to("/received_roommate_requests/#{the_received_roommate_request.id}", { :notice => "Received roommate request updated successfully."} )
    else
      redirect_to("/received_roommate_requests/#{the_received_roommate_request.id}", { :alert => "Received roommate request failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_received_roommate_request = ReceivedRoommateRequest.where({ :id => the_id }).at(0)

    the_received_roommate_request.destroy

    redirect_to("/received_roommate_requests", { :notice => "Received roommate request deleted successfully."} )
  end
end
