class CreateAnswersTable < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :description, null: false
      t.references :question, null: false
      t.references :user, null: false
      t.boolean :answer_chosen, default: false

      t.timestamps null: false
    end
  end
end
