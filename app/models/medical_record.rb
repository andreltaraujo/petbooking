class MedicalRecord < ApplicationRecord
  belongs_to :pet, inverse_of: :medical_records

# Kaminari
paginates_per 10

end
