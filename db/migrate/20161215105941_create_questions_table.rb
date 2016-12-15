class CreateQuestionsTable < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.text :description
      t.references :user, null: false

      t.timestamps null: false
    end
  end
end
