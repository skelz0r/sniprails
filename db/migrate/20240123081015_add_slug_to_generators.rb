class AddSlugToGenerators < ActiveRecord::Migration[7.1]
  def change
    add_column :generators, :slug, :string
    add_index :generators, :slug, unique: true
  end
end
