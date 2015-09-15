helpers do
  def current_user?
    User.find_by_id(session[:user_id]) != nil
  end
end