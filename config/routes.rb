Rails.application.routes.draw do



  # Routes for the Preference resource:
  get("/", { :controller => "user_authentication", :action => "index" })
  # CREATE
  post("/insert_preference", { :controller => "preferences", :action => "create" })
          
  # READ
  get("/preferences", { :controller => "preferences", :action => "index" })
  
  get("/preferences/:path_id", { :controller => "preferences", :action => "show" })
  
  # UPDATE
  
  post("/modify_preference/:path_id", { :controller => "preferences", :action => "update" })
  
  # DELETE
  get("/delete_preference/:path_id", { :controller => "preferences", :action => "destroy" })

  #------------------------------

  # Routes for the Roommate request resource:

  # CREATE
  post("/insert_roommate_request", { :controller => "roommate_requests", :action => "create" })
          
  # READ
  get("/roommate_sent_requests", { :controller => "roommate_requests", :action => "sent" })

  get("/roommate_received_requests", { :controller => "roommate_requests", :action => "received" })

  
  get("/roommate_sent_requests/:path_id", { :controller => "roommate_requests", :action => "sent_show" })

  get("/roommate_received_requests/:path_id", { :controller => "roommate_requests", :action => "received_show" })
  
  # UPDATE
  
  post("/modify_roommate_request/:path_id", { :controller => "roommate_requests", :action => "update" })
  
  # DELETE
  get("/delete_roommate_request/:path_id", { :controller => "roommate_requests", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------
  get("/welcome", { :controller => "user_authentication", :action => "dashboard" })

  # Routes for the Member resource:

  #READ
  get("/members", { :controller => "members", :action => "another_index"})
  get("/members_list", { :controller => "members", :action => "index"})
  get("/members_list/:path_id", { :controller => "members", :action => "show"})


  
end
