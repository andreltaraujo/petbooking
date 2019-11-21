class Pet < ApplicationRecord
  
  # Associations
  belongs_to :kind, inverse_of: :pets
  has_many :medical_records

  # Validations
  validates :name, presence: true, length: { minimum: 3 }
end
