class CreateProducts < ActiveRecord::Migration
    def change
        create_table :products do |t|
            t.text :name
            t.text :category
            t.text :application_type
            t.decimal :price_float
            t.text :price_string
            t.text :currency
            t.text :size
            t.text :ingredients_grouping
            t.text :image_url
            t.text :image_alt
            t.text :original_url

            # belongs to :brand
            t.references :brand, index: true
            t.timestamps null: false
        end
    end
end