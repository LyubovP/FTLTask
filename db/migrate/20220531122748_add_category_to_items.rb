class AddCategoryToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :category, :integer, default: 0
  end
end
