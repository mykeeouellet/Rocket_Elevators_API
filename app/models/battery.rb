class Battery < ApplicationRecord
    belongs_to :building
    has_many :employee
    has_many :column

    # IBM Watson
    # XXX Batteries are deployed across XXX cities
    nb_batteries = Battery.all
    nb_cities = Address.city.all
    request.body = JSON.dump({
    "text" => "#{nb_batteries} Batteries are deployed across #{nb_cities} cities"})
end
