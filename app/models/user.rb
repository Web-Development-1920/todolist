class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
    has_many :tasks, dependent: :destroy
    has_many :projects, dependent: :destroy

    validates :username, presence: true
    validates :password, presence: true
end