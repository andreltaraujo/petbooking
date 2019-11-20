class CreateMedicalRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :medical_records do |t|
      t.string :patient_symptoms
      t.string :applied_treatment
      t.references :pet, foreign_key: true

      t.timestamps
    end
  end
end
