class SessionsController < ApplicationController
  def new
  end

  def create
    response = RestClient.post('http://localhost:3000/users/sign_in', {
      user: {
        email: params[:email],
        password: params[:password]
      }
    })

    if response.code == 200
      result = JSON.parse(response.body)
      session[:jwt] = result['token']
      redirect_to dashboard_path, notice: "Logged in successfully"
    else
      flash[:alert] = "Login failed"
      render :new
    end
  rescue RestClient::ExceptionWithResponse => e
    flash[:alert] = JSON.parse(e.response.body)['error']
    render :new
  end

  def destroy
    session[:jwt] = nil
    redirect_to login_path, notice: "Logged out successfully"
  end
end
