class Review < ApplicationRecord
    belongs_to :client
    belongs_to :appointment

    # scope :service, -> { where(service_id: service.id)}
end
