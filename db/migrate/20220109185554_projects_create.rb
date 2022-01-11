class ProjectsCreate < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.integer :project_kind, null: false, default: 0
      t.timestamps
    end
  end
end
