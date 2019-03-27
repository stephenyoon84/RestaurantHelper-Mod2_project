class SessionsController < ApplicationController
  skip_before_action :authorized

  def new
  end

  def create
    username = params[:username]
    user = User.find_by(username: username)
    if user && user.authenticate(params[:password])
      session["user_id"] = user.id
      session["user_role"] = user.role
      if user.role == 'chef'
        redirect_to carts_index_path
      # elsif user.role == 'admin'
      else
        redirect_to menus_path
      end
    else
      flash[:notice] = "No username/password found with that combination"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
