class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :service
  has_many :reviews
  has_many :clients, through: :reviews

  validates :service, :date, :time, presence: true

end

