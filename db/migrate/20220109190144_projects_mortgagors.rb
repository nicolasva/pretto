class ProjectsMortgagors < ActiveRecord::Migration[7.0]
  def change
    create_table :projects_mortgagors do |t|
      t.references :project, foreign_key: true, null: false, index: true
      t.references :mortgagor, foreign_key: true, null: false, index: true
      t.timestamps
    end
  end
end
