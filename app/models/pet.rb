class Pet < ApplicationRecord
  
  # Associations
  belongs_to :kind, inverse_of: :pets
  has_many :medical_records

  accepts_nested_attributes_for :medical_records, reject_if: :all_blank, allow_destroy: true

  # Validations
  validates :name, presence: true, length: { minimum: 3 }
end
