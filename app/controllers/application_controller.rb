class ApplicationController < ActionController::Base
  # Create a method to return the current user
  def current_user
    @current_user ||= User.first
  end
  helper_method :current_user
end
