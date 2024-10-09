class CreateLs < ActiveRecord::Migration[7.2]
  def change
    create_table :ls do |t|
      t.timestamps
    end
  end
end
