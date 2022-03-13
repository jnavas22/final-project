class RoommateRequestsController < ApplicationController
  def index_sent
    matching_roommate_requests = RoommateRequest.all

    @list_of_roommate_requests = matching_roommate_requests.order({ :created_at => :desc })

    render({ :template => "roommate_requests/index_sent.html.erb" })
  end

  def show_sent
    the_id = params.fetch("path_id")

    matching_roommate_requests = RoommateRequest.where({ :id => the_id })

    @the_roommate_request = matching_roommate_requests.at(0)

    render({ :template => "roommate_requests/show_sent.html.erb" })
  end
  def index_received
    matching_roommate_requests = RoommateRequest.all

    @list_of_roommate_requests = matching_roommate_requests.order({ :created_at => :desc })

    render({ :template => "roommate_requests/index_received.html.erb" })
  end

  def show_received
    the_id = params.fetch("path_id")

    matching_roommate_requests = RoommateRequest.where({ :id => the_id })

    @the_roommate_request = matching_roommate_requests.at(0)

    render({ :template => "roommate_requests/show_received.html.erb" })
  end

  def create
    the_roommate_request = RoommateRequest.new
    the_roommate_request.sender_id = params.fetch("query_sender_id")
    the_roommate_request.recipient_id = params.fetch("query_recipient_id")

    if the_roommate_request.valid?
      the_roommate_request.save
      redirect_to("/roommate_requests", { :notice => "Roommate request created successfully." })
    else
      redirect_to("/roommate_requests", { :notice => "Roommate request failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_roommate_request = RoommateRequest.where({ :id => the_id }).at(0)

    the_roommate_request.sender_id = params.fetch("query_sender_id")
    the_roommate_request.recipient_id = params.fetch("query_recipient_id")

    if the_roommate_request.valid?
      the_roommate_request.save
      redirect_to("/roommate_requests/#{the_roommate_request.id}", { :notice => "Roommate request updated successfully."} )
    else
      redirect_to("/roommate_requests/#{the_roommate_request.id}", { :alert => "Roommate request failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_roommate_request = RoommateRequest.where({ :id => the_id }).at(0)

    the_roommate_request.destroy

    redirect_to("/roommate_requests", { :notice => "Roommate request deleted successfully."} )
  end

  def personal_info
    the_id = params.fetch("path_id")

    matching_roommate_requests = RoommateRequest.where({ :id => the_id })
    @the_roommate_request = matching_roommate_requests.at(0)
    
    render(:template => "roommate_requests/personal_info_sent.html.erb")
  end

  def clean_updates
    render({ :template => "roommate_requests/clean_updates.html.erb" })
  end
end
