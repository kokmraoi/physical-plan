class CreateAssessments < ActiveRecord::Migration[6.0]
  def change
    create_table :assessments do |t|
      t.text :purpose, null: false
      t.integer :weight, null: false
      t.integer :pain_hip_id, null: false
      t.integer :dysesthesia_hip_id, null: false
      t.integer :sensory_hip_id, null: false
      t.integer :strength_hip_flexion_id, null: false
      t.integer :strength_hip_extension_id, null: false
      t.integer :strength_hip_abduction_id, null: false
      t.integer :strength_hip_adduction_id, null: false
      t.integer :strength_hip_external_id, null: false
      t.integer :strength_hip_internal_id, null: false
      t.integer :range_hip_flexion_id, null: false
      t.integer :range_hip_extension_id, null: false
      t.integer :range_hip_abduction_id, null: false
      t.integer :range_hip_adduction_id, null: false
      t.integer :range_hip_external_id, null: false
      t.integer :range_hip_internal_id, null: false
      t.references :user, null: false, foreign_key: true
      t.references :chart, null: false, foreign_key: true
      t.timestamps
    end
  end
end
