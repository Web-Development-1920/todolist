class Notification < ApplicationRecord
    belongs_to :user

    validates :data, presence: true
end