class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :services
  has_many :reviews
  has_many :clients, through: :reviews
end

