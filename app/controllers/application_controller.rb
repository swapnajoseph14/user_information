class ApplicationController < ActionController::Base
  
  def authenticate_admin
    unless session[:admin].present?
      redirect_to root_url
    end
  end
  
end
