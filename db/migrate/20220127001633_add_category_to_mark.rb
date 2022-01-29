class AddCategoryToMark < ActiveRecord::Migration[5.2]
  def change
    add_reference :marks, :category, foreign_key: true
  end
end
