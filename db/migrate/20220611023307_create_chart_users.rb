class CreateChartUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :chart_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :chart, null: false, foreign_key: true
      t.timestamps
    end
  end
end
