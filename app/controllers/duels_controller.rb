class DuelsController < ApplicationController
  before_action :authenticate, except: :show

  def show
    @duel = Duel.find(params[:id])
  end

  def new
    @duel = Duel.new
  end

  def create
    @duel = Duel.new(duel_params)
    if @duel.save
      redirect_to @duel, notice: '作成しました'
    else
      render :new
    end
  end

  def edit
    @duel = Duel.find(params[:id])
  end

  def update
    @duel = Duel.find(params[:id])
    if @duel.update(duel_params)
      redirect_to @duel, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    @duel = Duel.find(params[:id])
    @duel.destroy!
    redirect_to root_path, notice: '削除しました'
  end

  private

  def duel_params
    params.require(:duel).permit(
      :winner_id, :loser_id, :date, :life_points, :content
    )
  end
end
