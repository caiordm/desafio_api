class UsersController < ApplicationController
  before_action :authenticate_user!

  def confirm_email
  user = User.find_by(confirmation_token: params[:token])

    if user && user.confirmation_sent_at > 2.hours.ago
      user.update(confirmed_at: Time.now.utc, confirmation_token: nil)
      render json: { message: "Email confirmado com sucesso!" }, status: :ok
    else
      render json: { message: "Token inválido ou expirado" }, status: :unprocessable_entity
    end
  end

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
    params.permit(:name, :email, :avatar)
  end
end
