class WelcomeController < ApplicationController
  def index
    render json: { status: "It works!"} # comment this line if you want to use views
  end
end
