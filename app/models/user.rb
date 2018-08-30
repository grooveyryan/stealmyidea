class User < ApplicationRecord
  has_many :posts
  has_many :comments
  
  validates :user_name, presence: true, length: { minimum: 4, maximum: 18 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
