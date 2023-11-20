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
  end

  private

  def set_monster
    @monster = Monster.find(params[:id])
  end

  def monster_params
    params.require(:monster).permit(:name, :species, :ability, :address, :price)
  end

end
