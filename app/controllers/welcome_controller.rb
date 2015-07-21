class WelcomeController < ApplicationController
  def index
    @duels = Duel.page(params[:page]).order('date DESC, created_at DESC')
  end

  def dentaku
  end
end
