class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @purchases = @user.purchases
  end

  def edit
  end

  def update
    if params[:user][:password].present?
      if @user.update_attributes(user_params)
        redirect_to root_path, notice: 'Usuario actualizado satisfactoriamente. Inicia sesión con tu nueva contraseña'
      else
        render action: 'edit'
      end
    else
      if @user.update_without_password(user_params)
        redirect_to @user, notice: 'Usuario actualizado satisfactoriamente'
      else
        render action: 'edit'
      end
    end
  end


  private

    def set_user
      @user = User.find(current_user.id)
    end

    def user_params
      params.require(:user).permit(:email, :name, :last_name, :address, :phone, :mobile_phone, :avatar, :password)
    end

end
