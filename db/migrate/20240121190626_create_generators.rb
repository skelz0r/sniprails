class CreateGenerators < ActiveRecord::Migration[7.1]
  def change
    create_table :generators do |t|
      t.string :title, null: false
      t.text :description
      t.jsonb :commands, default: []

      t.timestamps
    end
  end
end
