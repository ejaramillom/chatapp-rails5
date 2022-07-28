class UsersController < ApplicationController
  before_action :authenticate_user
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "El usuario fue guardado con éxito"
    else
      render :index
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :name, :phone, :sendinformationstatus)
    end
end
