class GeolocationController < ApplicationController
  def index
    @users = [
      {
        "latitude" => 46.0632019,
        "longitude" => -70.9386751
    },
    {
        "latitude" => 46.0636932,
        "longitude" => -70.9448763
    }]

    @users.inspect
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
              marker.lat user["latitude"]
              marker.lng user["longitude"]
            end

  end
end
