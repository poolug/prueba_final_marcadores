class AddTypeToMark < ActiveRecord::Migration[5.2]
  def change
    add_reference :marks, :type, foreign_key: true
  end
end
