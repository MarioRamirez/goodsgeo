class AddPlaceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :place, :string
  end
end
