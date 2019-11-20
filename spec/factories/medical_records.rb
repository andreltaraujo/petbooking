FactoryBot.define do
  factory :medical_record do
    patient_symptoms { "MyString" }
    applied_treatment { "MyString" }
    pet { nil }
  end
end
