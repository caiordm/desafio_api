class UsersController < ApplicationController
  before_action :authenticate_user!

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      render json: {
        message: "Atualizado com sucesso!",
        user: @user
      }, status: :ok
    else
      render json: {
        message: @user.errors.full_messages
      }, status: :unprocessable_entity
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar)
  end
end
