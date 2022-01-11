class Documents < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.references :project, null: false, foreign_key: true, index: true
      t.references :mortgagor, null: true, foreign_key: true, index: true, default: nil
      t.integer :document, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.integer :month, null: true, default: nil
      t.integer :year, null: true, default: nil
      t.timestamps
    end
  end
end
