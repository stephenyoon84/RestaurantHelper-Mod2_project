class AddCategoryToMenu < ActiveRecord::Migration[5.1]
  def change
    add_column :menus, :category, :string
  end
end
