module ApplicationHelper

  def current_host
    Rails.env.development? ? "http://localhost:3000" : "https://gawi-app.herokuapp.com"
  end

end
