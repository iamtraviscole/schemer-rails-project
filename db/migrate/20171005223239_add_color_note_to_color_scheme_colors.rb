class AddColorNoteToColorSchemeColors < ActiveRecord::Migration[5.1]
  def change
    add_column :color_scheme_colors, :color_note, :string
  end
end
