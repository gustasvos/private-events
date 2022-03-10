class Event < ApplicationRecord
    validates :title, presence: true
    validates :location, presence: true
    validates :date, presence: true


    belongs_to :creator, class_name: 'User', foreign_key:'user_id'
    has_many :attendances
    has_many :users, through: :attendances
end