module SessionsHelper

def log_in(user)
	user.remember
	cookies.permanent.signed[:user_id] = user.id
	cookies.permanent[:remember_token] = user.remember_token
end

def logged_in?
	!current_user.nil?
end

def log_out
	cookies.delete(:user_id)
  cookies.delete(:remember_token)
  @current_user = nil 
  redirect_to root_url
end

def current_user
	if (user_id = cookies.signed[:user_id])
	  user = User.find_by(id: user_id)
	  if user && user.authenticated?(cookies[:remember_token])
	  	log_in (user)
	  	@current_user = user
	  	return @current_user
	  else 
	  	return nil 
	  end
	  else 
	return nil 
	end
end




end
