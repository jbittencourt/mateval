# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def left_box
		return " <img src='images/unlogged/login.jpg'>
					<div class=\"login\">
						</br>
						Professor(a):</br>
						<input type=\"text\"></br></br>
						Senha:</br>
						<input type=\"password\">
					</div>
					<div class=\"minor-box\">
						</br>Esqueceu a senha?
					</div>"
	end

	def top
		return "<div class=\"banner\">
				<img src=\"images/unlogged/top.jpg\" alt=\"Escola Luciana de Abreu\">
			</div>"
	end

end
