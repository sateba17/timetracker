class CreateProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.integer :company_id
      t.integer :default_rate
      t.timestamps
    end
  end
end
