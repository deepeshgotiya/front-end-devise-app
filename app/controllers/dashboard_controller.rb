class DashboardController < ApplicationController
  before_action :authenticate_user!

  def show
    token = session[:jwt]

    if token.nil?
      redirect_to login_path, alert: "You need to log in to access this page"
      return
    end

    response = RestClient.get('http://localhost:3000/dashboard', {
      Authorization: "Bearer #{token}"
    })

    @data = JSON.parse(response.body)
  rescue RestClient::Unauthorized
    redirect_to login_path, alert: "Your session has expired, please log in again"
  end
end
