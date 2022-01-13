class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.text :body
      t.boolean :correct?
      t.integer :belongs_to

      t.timestamps
    end
  end
end
