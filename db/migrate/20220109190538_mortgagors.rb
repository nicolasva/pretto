class Mortgagors < ActiveRecord::Migration[7.0]
  def change
    create_table :mortgagors do |t|
      t.string :first_name, null: false
      t.integer :contract, null: false, default: 0
      t.integer :civil_status, default: 0 
      t.timestamps
    end
  end
end
