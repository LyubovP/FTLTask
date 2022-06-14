class ChangeItemsPrice < ActiveRecord::Migration[7.0]
  def up
    change_table :items do |t|
      t.change :price, :decimal 
    end
  end

  def down
    change_table :items do |t|
      t.change :price, :integer
    end
  end
end
