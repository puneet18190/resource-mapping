class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.string :title
      t.text :description
      t.references :tool, index: true

      t.timestamps null: false
    end
    add_foreign_key :sections, :tools
  end
end
