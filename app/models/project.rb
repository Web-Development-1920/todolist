class Project < ApplicationRecord
	has_many :shares, dependent: :destroy
	has_many :users, through: :shares
	has_many :tasks, dependent: :destroy
	validates :name, presence: true
end
