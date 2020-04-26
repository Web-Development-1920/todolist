class Project < ApplicationRecord
	has_many :shares
	has_many :users, through: :shares
	has_many :tasks, dependent: :destroy
	validates :name, presence: true
end
