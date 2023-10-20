module ApplicationHelper
   def auth_link
    if user_signed_in?
      button_to 'Sign out', destroy_user_session_path, method: :delete, class: 'btn btn-danger'
    else
      link_to 'Login', new_user_session_path, class: 'btn btn-primary'
    end
  end
end
