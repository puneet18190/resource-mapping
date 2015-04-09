class CreateContentBlocks < ActiveRecord::Migration
  def change
    create_table :content_blocks do |t|
      t.string :title
      t.references :tool, index: true

      t.timestamps null: false
    end
    add_foreign_key :content_blocks, :tools
  end
end
