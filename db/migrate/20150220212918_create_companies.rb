class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :website
      t.string :email
      t.string :phone
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :companies, :users
  end
end
