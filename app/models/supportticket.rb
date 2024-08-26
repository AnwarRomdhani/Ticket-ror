class Supportticket < ApplicationRecord
  belongs_to :user
  has_many :responses, dependent: :destroy

  # Callbacks
  before_validation :set_default_status, on: :create

  # Validations
  validates :title, :description, :status, presence: true
  validates :status, inclusion: { in: %w(pending closed) }

  private

  # Sets the default status to 'pending' if it's not provided
  def set_default_status
    self.status ||= 'pending'
  end
end
