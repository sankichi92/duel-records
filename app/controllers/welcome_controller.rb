class WelcomeController < ApplicationController
  def index
    @duels = Duel.order('date DESC, created_at DESC')
  end

  def dentaku
  end
end
