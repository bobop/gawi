module ApplicationHelper

  def current_host
    Rails.env.development? ? "http://localhost:3000" : "http://gawi-app.heroku.com"
  end

end
