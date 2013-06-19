class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :name
      t.text :content
      t.references :topic, index: true

      t.timestamps
    end
  end
end
