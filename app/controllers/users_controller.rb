class UsersController < ApplicationController
  before_action :authenticate

  def show
    @user = current_user
    @users = User.where.not(id: current_user.id).order(:nickname)
    if params[:start] && params[:end]
      @duels = @user.played_duels.where(['date BETWEEN ? AND ?', params[:start], params[:end]])
    else
      @duels = @user.played_duels
    end
  end

  def retire
  end

  def destroy
    if current_user.destroy
      reset_session
      redirect_to root_path, notice: '退会しました'
    else
      render :retire
    end
  end
end
