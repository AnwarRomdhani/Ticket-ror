class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :username, presence: true

  has_many :supporttickets, dependent: :destroy
  has_many :responses, dependent: :destroy
end
