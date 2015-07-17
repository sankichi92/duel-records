class DuelsController < ApplicationController
  before_action :authenticate

  def new
    @duel = Duel.new
    @users = User.all.order(:nickname)
  end

  def create
    @duel = Duel.new(duel_params)
    if @duel.save
      redirect_to @duel, notice: '作成しました'
    else
      render :new
    end
  end

  private

  def duel_params
    params.require(:duel).permit(
      :winner, :loser, :date, :life_points, :content
    )
  end
end
