class Appointment < ApplicationRecord
  belongs_to :client
  belongs_to :service
  has_many :reviews
  has_many :clients, through: :reviews

  validates :service, :date, :time, presence: true

  validate :appointment_date_cannot_be_in_the_past

  def appointment_date_cannot_be_in_the_past
    if date.present? && date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

  
end

