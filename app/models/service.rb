class Service < ApplicationRecord
    has_many :appointments
    has_many :clients, through: :appointments

    #scope :alpha, -> {order(:name)}

    scope :search_service, ->(service_search) {where("name LIKE ?", "%#{service_search}%")}


end

