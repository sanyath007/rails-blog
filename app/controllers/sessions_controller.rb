class SessionsController < ApplicationController
  include CurrentUserConcern

  def new
  end

  def create
    # use rails views
    # user = User.find_by_email(params[:email])
    
    # if user && user.authenticate(params[:password])
    #   session[:user_id] = user.id
    #   redirect_to root_url, notice: "Logged in!"
    # else
    #   flash.now[:alert] = "Email or password is invalid!"
    #   render "new"
    # end

    # use frontend app
    user = User
            .find_by(email: params["user"]["email"])
            .try(:authenticate, params["user"]["password"])
    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      render json: { status: 401 }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  def logged_in
    if @current_user
      render json: {
        logged_in: true
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  def logout
    reset_session
    render json: { status: 200, logged_out:true }
  end
end
