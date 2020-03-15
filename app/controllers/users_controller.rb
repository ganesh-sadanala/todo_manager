class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # render plain: "This is inside UsersController"
    render plain: User.all.map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: "#{user.to_pleasant_string}"
  end

  def create
    User.create!(
      name: params[:name],
      email: params[:email],
      password: params[:password],
    )
    render plain: "User created Successfully!"
  end

  def login
    render plain: User.where("email=? and password=?", params[:email], params[:password]).exists?
  end
end
