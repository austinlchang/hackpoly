class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Devise
  def after_sign_in_path_for(resource)
    # go to profile after signing in if it is first time logging in
    if current_user.sign_in_count == 1
      user_profile_path
    else
      user_application_path
    end
  end

end
