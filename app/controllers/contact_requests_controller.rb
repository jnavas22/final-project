class ContactRequestsController < ApplicationController
  def index
    matching_contact_requests = ContactRequest.all

    @list_of_contact_requests = matching_contact_requests.order({ :created_at => :desc })

    render({ :template => "contact_requests/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_contact_requests = ContactRequest.where({ :id => the_id })

    @the_contact_request = matching_contact_requests.at(0)

    render({ :template => "contact_requests/show.html.erb" })
  end

  def create
    the_contact_request = ContactRequest.new
    the_contact_request.sender_id = params.fetch("query_sender_id")
    the_contact_request.recipient_id = params.fetch("query_recipient_id")

    if the_contact_request.valid?
      the_contact_request.save
      redirect_to("/updates", { :notice => "Contact request created successfully." })
    else
      redirect_to("/updates", { :notice => "Contact request failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_contact_request = ContactRequest.where({ :id => the_id }).at(0)

    the_contact_request.sender_id = params.fetch("query_sender_id")
    the_contact_request.recipient_id = params.fetch("query_recipient_id")

    if the_contact_request.valid?
      the_contact_request.save
      redirect_to("/contact_requests/#{the_contact_request.id}", { :notice => "Contact request updated successfully."} )
    else
      redirect_to("/contact_requests/#{the_contact_request.id}", { :alert => "Contact request failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_contact_request = ContactRequest.where({ :id => the_id }).at(0)

    the_contact_request.destroy

    redirect_to("/updates", { :notice => "Contact request deleted successfully."} )
  end
end
