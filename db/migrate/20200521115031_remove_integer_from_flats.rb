class RemoveIntegerFromFlats < ActiveRecord::Migration[6.0]
  def change
    remove_column :flats, :integer, :string
  end
end
