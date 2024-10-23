class RegistrationsController < ApplicationController
  def new
  end

  def create
    response = RestClient.post('http://localhost:3000/users/sign_in', {
      user: {
        email: params[:email],
        password: params[:password],
        password_confirmation: params[:password_confirmation]
      }
    })

    if response.code == 200
      redirect_to login_path, notice: "Sign up successful! Please log in."
    else
      flash[:alert] = "Sign up failed"
      render :new
    end
  rescue RestClient::ExceptionWithResponse => e
    flash[:alert] = JSON.parse(e.response.body)['error']
    render :new
  end
end
