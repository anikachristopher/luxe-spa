class Client < ApplicationRecord
    has_secure_password

    has_many :appointments
    has_many :services, through: :appointments

    has_many :reviews
    has_many :reviewed_appointments, through: :reviews, source: :client
    
   
end
