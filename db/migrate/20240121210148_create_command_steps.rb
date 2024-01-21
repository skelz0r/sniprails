class CreateCommandSteps < ActiveRecord::Migration[7.1]
  def up
    create_table :command_steps do |t|
      t.string :type, null: false
      t.jsonb :properties, default: {}
      t.integer :position, null: false, default: 1
      t.references :generator, null: false, foreign_key: true

      t.timestamps
    end

    add_index :command_steps, [:position, :generator_id], unique: true

    remove_column :generators, :commands, :jsonb
  end

  def down
    drop_table :command_steps

    add_column :generators, :commands, :jsonb, default: []
  end
end
