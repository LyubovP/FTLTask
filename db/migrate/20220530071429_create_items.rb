class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :title
      t.float :price
      t.integer :card_id
      t.integer :user_id
      
      t.timestamps
    end
  end
end
