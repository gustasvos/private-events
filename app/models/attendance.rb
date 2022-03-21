class Attendance < ApplicationRecord
    has_many :admin
    belongs_to :event

    # 1 attendance = 1 evento
    # 1 attendance = varios admins
end