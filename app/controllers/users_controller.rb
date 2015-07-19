class UsersController < ApplicationController
  before_action :authenticate

  def show
    @user = current_user
    @users = User.where.not(id: current_user.id).order(:nickname)
  end
end
