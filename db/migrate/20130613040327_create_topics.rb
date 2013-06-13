class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :subject
      t.string :name
      t.text :body

      t.timestamps
    end
  end
end
