# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper


	def left_box
		if logged_in?
			"loged"
		
		else
			output = []
			output << form_tag('/account/login')
			#output << form_for(:account , :url=> login_account_url) do |f|
				output << image_tag("/images/unlogged/login.jpg") 
				output << "
						<div class=\"login\"><br/>
						Professor(a):</br>
						<input type=\"text\" name=\"username\"><br/><br/>
						Senha:</br>
						<input type=\"password\" name=\"password\">"
						output << submit_tag("login")
						output << "</form>"
			#end
					output << "</div>
				<div class=\"minor-box\">
					</br>Esqueceu a senha?
				</div>"

			return output.join("\n ")
		end
	end

	def top
		if logged_in?
			"loged"
		else
		 "<div class=\"banner\">
				<img src=\"images/unlogged/top.jpg\" alt=\"Escola Luciana de Abreu\">
			</div>"
		end
	end

end
