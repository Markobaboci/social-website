class CreateConsultations < ActiveRecord::Migration[7.2]
  def change
    create_table :consultations do |t|
      t.string :name
      t.text :address
      t.text :kontakt
      t.text :opening_hours

      t.timestamps
    end
  end
end
