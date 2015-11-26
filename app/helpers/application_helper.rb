module ApplicationHelper
	def navbar_login_signin(controller)
	  return true if params[:controller] == controller || current_user
	end

end
