class UsersController < ApplicationController
  def user
    @monsters = Monster.where(user_id: current_user.id)
    # The `geocoded` scope filters only flats with coordinates
    @markers_tracking = @monsters.map do |monster|
    {
      lat: monster.latitude,
      lng: monster.longitude,
      popup_monster_html: render_to_string(partial: "tracking_popup", locals: { monster: monster })
    }
    end
  end
end
