class CreateComponents < ActiveRecord::Migration
  def change
    create_table :components do |t|
      t.string :title
      t.text :description
      t.references :section, index: true

      t.timestamps null: false
    end
    add_foreign_key :components, :sections
  end
end
