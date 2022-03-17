class Attendance < ApplicationRecord
    belongs_to :admin
    belongs_to :event
end