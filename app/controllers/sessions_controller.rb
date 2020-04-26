class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render plain: "You have rendered correct password!"
    else
      render plain: "Incorrect password!"
    end
  end
end
