class Kind < ApplicationRecord
  has_many :pets

  accepts_nested_attributes_for :pets
end
