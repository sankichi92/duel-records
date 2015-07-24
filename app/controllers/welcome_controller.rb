class WelcomeController < ApplicationController
  def index
    @users = User.order('rating DESC')
  end

  def dentaku
  end
end
