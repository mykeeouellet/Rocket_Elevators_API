
class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable, :recoverable, stretches: 13
  # devise :database_authenticatable, :registerable, :recoverable, :confirmable, stretches: 13
  belongs_to :battery, optional: true

  # IBM Watson
  # Greetings to the logged users/employees
  # first_name = self.firstname
  # request.body = JSON.dump({
  #   "text" => "Hello, #{first_name} Welocme to the Rocket Elevators Admin Dashboard!"})
end