class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def autherize
  	unless session[:username]
  		redirect_to '/login'
  	end
  end
end
