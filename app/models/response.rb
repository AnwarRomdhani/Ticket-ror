class Response < ApplicationRecord
  belongs_to :supportticket
  belongs_to :user

  validates :body, presence: true
end
