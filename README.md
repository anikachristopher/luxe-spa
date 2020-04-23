Notes

Models:

Appointment
    belongs_to :Client
    has_many :services
    has_many :clients, through: :services
    belongs_to :services
    
    Attributes
    date
    time


                                                                             join table - ClientAppointment

Client(User)
    has_many :appointments
    has_many :reviews
    has_many :appointment_reviews, through :appointments
    has_many :services, through: :appointments

    Attributes
    username
    email
    phone
    password_digest


Review(Comment)
    belongs_to :client
    belongs_to :appointment
    content


Service
    has_many :appointments
    has_many :clients, through: :appointments

    attributes
    name
    duration 