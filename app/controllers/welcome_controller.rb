class WelcomeController < ApplicationController
  def index
    @pets = Pet.all.page(params[:page]).per(10)
  end
end
