class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :help
      t.references :component, index: true

      t.timestamps null: false
    end
    add_foreign_key :questions, :components
  end
end
