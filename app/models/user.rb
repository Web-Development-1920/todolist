class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

    has_many :shares, dependent: :destroy
    has_many :tasks, dependent: :destroy
    has_many :notifications, dependent: :destroy
    has_many :projects, through: :shares
    
    validates :name, :username, :email, :password, presence: true
    validates_uniqueness_of :username, :email
    validate :password_complexity

    def password_complexity
        return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/
    
        errors.add :password, 'Complexity requirement not met. Please use: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
      end
end