class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.text :name
      t.text :alternate_names
      t.boolean :is_animal_derived
      t.boolean :is_organic

      t.timestamps null: false
    end
  end
end
