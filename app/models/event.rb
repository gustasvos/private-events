class Event < ApplicationRecord
    validates :title, presence: true
    validates :description, presence: true
    validates :location, presence: true
    validates :date, presence: true

    belongs_to :creator, class_name: 'Admin', foreign_key: :admin_id
    has_one :attendances, class_name: 'Attendance'

    # 1 evento = 1 admin criador
    # 1 evento = 1 attendance
end