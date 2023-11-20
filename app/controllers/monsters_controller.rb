class MonstersController < ApplicationController

  before_action :set_monster, only: [:show]
  
  def index
    @monsters = Monster.all
  end

  def show
  end

  private

  def set_monster
    @monster = Monster.find(params[:id])
  end

end
