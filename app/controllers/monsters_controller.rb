class MonstersController < ApplicationController
  before_action :set_monster, only: %i[show edit update destroy]
  before_action :monster_params, only: [:create]
  before_action :bookable?, only: [:show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @monsters = Monster.all

    @bookable_monsters = bookable?

    # The `geocoded` scope filters only monsters with coordinates
    @markers = @bookable_monsters.geocoded.map do |monster|
      {
        lat: monster.latitude,
        lng: monster.longitude,
        popup_monster_html: render_to_string(partial: "popup_monster", locals: {monster: monster})
      }
    end
  end

  def show
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @monster = Monster.new
  end

  def create
    @monster = Monster.new(monster_params)
    @monster.user = current_user
    @monster.bookable = true
    if @monster.save
      redirect_to monster_path(@monster)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @monster.update(monster_params)
    if @monster.save
      redirect_to user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @monster.destroy
    redirect_to user_path, status: :see_other
  end

  private

  # Checkif monster is bookable
  def bookable?
    @bookable_monsters = Monster.where(bookable: true)
  end

  def set_monster
    @monster = Monster.find(params[:id])
  end

  def monster_params
    params.require(:monster).permit(:name, :species, :ability, :address, :price, :photo, :bookable)
  end
end
