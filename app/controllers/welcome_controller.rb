class WelcomeController < ApplicationController
  def index
    @duels = Duel.order('date DESC')
  end

  def dentaku 
  end
end
