class Client < ApplicationRecord
    has_secure_password
    
    has_many :appointments
    has_many :services, through: :appointments

    has_many :reviews
    has_many :reviewed_appointments, through: :reviews, source: :client
    
    validates_presence_of :first_name, :last_name, format: { with: /\A[a-zA-Z]+\Z/ }
    validates :email, format: {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |client|
            client.first_name = auth.info.first_name
            client.last_name = auth.info.last_name
            client.email = auth.info.email
            client.password = SecureRandom.hex
        end
    end

   
end
