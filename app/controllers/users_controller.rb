class UsersController < ApplicationController
  def edit
  end

  def update
    current_user.update(user_params)
    if redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
