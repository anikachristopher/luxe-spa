class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :services
end
