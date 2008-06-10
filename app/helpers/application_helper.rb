# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper


  # Render the login box or profile side_bar
  #
  # The html files leave in:
  #   * app/views/account/_login_box
  #   * app/view/account/_profile_box
  #
	def side_bar_left
		if logged_in?
      return render(:partial => 'account/profile_box')  
    else
      return render(:partial => 'account/login_box')
		end
	end

  # Render the main menu, located in the top of site
  #
  #
	def header_menu
		if logged_in?
			output = []
			output << link_to(image_tag("/images/logged/my_classes.png"), {:controller => 'classrooms'}) 
			output << image_tag("/images/logged/class_diary.png")
      
      if is_admin?
        output << link_to(image_tag("/images/logged/class_diary.jpg"), {:controller => 'admin'})
      end			
      return output.join("\n")

		else
		 	return image_tag("/images/unlogged/top.jpg") 
		end
	end

end
