class MonstersController < ApplicationController

  before_action :set_monster, only: [:show]
  before_action :monster_params, only: [:create]

  def index
    @monsters = Monster.all
  end

  def show
  end

  def new
    @monster = Monster.new
  end

  def create
    @monster = Monster.new(monster_params)
    @monster.user = current_user
    if @monster.save
      redirect_to monster_path(@monster)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_monster
    @monster = Monster.find(params[:id])
  end

  def monster_params
    params.require(:monster).permit(:name, :species, :ability, :address, :price)
  end

end
