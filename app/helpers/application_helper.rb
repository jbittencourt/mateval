# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper


	def left_box
		if logged_in?
			output = []
			output << image_tag("/images/logged/dummy.jpg") 
			output <<	"<div class=\"user-menu\">"
			output <<     "<b>" + session[:name] + "</b><br/>"
			output <<		"Editar Perfil<br />"
			output <<		button_to ("Sair" , :controller => :account , :action => :logout)
			output <<	"</div>"

			output << "<div class=\"orange-box\"></div>"
			output << image_tag("/images/logged/pcn.jpg", :style => "margin-bottom: 0px")
			return output.join("\n ")

		else
			output = []
			output << form_tag('/account/login')
			output << image_tag("/images/unlogged/login.jpg") 
			output << "
						<div class=\"login\"><br/>
						Professor(a):</br>
						<input type=\"text\" name=\"username\"><br/><br/>
						Senha:</br>
						<input type=\"password\" name=\"password\">"
			output << submit_tag("login")
			output << "</form>"
			output << "</div>
				<div class=\"minor-box\">
					</br>Esqueceu a senha?
				</div>"

			return output.join("\n ")
		end
	end

	def top
		if logged_in?
			output = []
			output << image_tag("/images/logged/my_classes.jpg") 
			output << image_tag("/images/logged/class_diary.jpg")
			return output.join("\n ")

		else
		 	return image_tag("/images/unlogged/top.jpg") 
		end
	end

end
