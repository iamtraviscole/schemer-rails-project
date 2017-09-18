class RemoveNameFromColors < ActiveRecord::Migration[5.1]
  def change
    remove_column :colors, :name, :string
  end
end
