class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :created_events, class_name: 'Event', foreign_key: :admin_id
  has_many :attended_event, class_name: 'Attendance'
  # 1 admin = varios eventos
  # 1 admin = varias attendances
end
