class CreateProducts < ActiveRecord::Migration
    def change
        create_table :products do |t|
            t.text :name
            t.text :category
            t.text :application_type
            t.decimal :price
            t.text :currency
            t.text :size
            t.text :ingredientsGrouping

            # belongs to :brand
            t.references :brand, index: true
            t.timestamps null: false
        end
    end
end
