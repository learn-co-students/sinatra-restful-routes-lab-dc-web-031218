class CreateRecipes < ActiveRecord::Migration[5.1]
  # Recipes should have a name, ingredients (which can
  # be written as one string containing all the ingredients), and cook_time.
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :ingredients
      t.string :cook_time
    end
  end
end
