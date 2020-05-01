class Service < ApplicationRecord
    has_many :appointments
    has_many :clients, through: :appointments

    # scope :by_cost, -> {where(cost: < 100)}

    scope :alpha, -> {order(:name)}
end

