class CreateColorSchemeColors < ActiveRecord::Migration[5.1]
  def change
    create_table :color_scheme_colors do |t|
      t.integer :color_scheme_id
      t.integer :color_id

      t.timestamps
    end
  end
end
