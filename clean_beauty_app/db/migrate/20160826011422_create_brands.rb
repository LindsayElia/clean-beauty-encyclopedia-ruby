class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.text :name
      t.text :site_url
      t.text :hq_country
      t.text :hq_region
      t.text :hq_postal_code
      t.integer :year_founded
      t.boolean :is_vegan
      t.boolean :contains_vegan
      t.boolean :is_gluten_free

      t.timestamps null: false
    end
  end
end
