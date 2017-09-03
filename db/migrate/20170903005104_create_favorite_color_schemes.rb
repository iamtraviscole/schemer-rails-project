class CreateFavoriteColorSchemes < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_color_schemes do |t|
      t.integer :user_id
      t.integer :color_scheme_id

      t.timestamps
    end
  end
end
