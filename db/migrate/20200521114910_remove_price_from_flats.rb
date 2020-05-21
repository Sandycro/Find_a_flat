class RemovePriceFromFlats < ActiveRecord::Migration[6.0]
  def change
    remove_column :flats, :price, :string
  end
end
