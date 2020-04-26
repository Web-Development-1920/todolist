class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

    has_many :shares
    has_many :tasks, dependent: :destroy
    has_many :projects, through: :shares
    
    validates :name, :username, :email, :password, presence: true
    validates_uniqueness_of :username, :email
end