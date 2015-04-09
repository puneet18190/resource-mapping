class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :title
      t.string :type
      t.string :url
      t.references :component, index: true

      t.timestamps null: false
    end
    add_foreign_key :resources, :components
  end
end
