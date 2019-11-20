class Pet < ApplicationRecord
  belongs_to :kind
  has_one :medical_record
end
