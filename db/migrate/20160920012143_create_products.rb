class CreateProducts < ActiveRecord::Migration
    def change
        create_table :products do |t|
            t.text :name
            t.decimal :price_float
            t.text :price_string
            t.text :currency
            t.text :size
            t.text :ingredients_grouping
            t.text :image_url
            t.text :image_alt
            t.text :original_url
            t.text :category_high_level
            t.text :category_mid_level
            t.text :category_low_level
            t.text :application_type
            t.boolean :concern_vegan
            t.boolean :cconcern_gluten_free
            t.boolean :concern_acne
            t.boolean :concern_eczema
            t.boolean :concern_rosacea

            # belongs to :brand
            t.references :brand, index: true
            t.timestamps null: false
        end
    end
end
