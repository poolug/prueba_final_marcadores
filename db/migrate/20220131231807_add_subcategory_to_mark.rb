class AddSubcategoryToMark < ActiveRecord::Migration[5.2]
  def change
    add_column :marks, :sub_category, :integer
  end
end
