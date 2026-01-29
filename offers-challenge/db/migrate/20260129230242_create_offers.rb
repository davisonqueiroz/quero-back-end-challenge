class CreateOffers < ActiveRecord::Migration[8.1]
  def change
    create_table :offers do |t|
      t.string :course_name
      t.decimal :rating, precision: 3, scale: 1
      t.decimal :full_price, precision: 10, scale: 2
      t.decimal :offered_price, precision: 10, scale: 2
      t.string :kind
      t.string :level
      t.string :ies_logo
      t.string :ies_name
      t.decimal :discount_percentage, precision: 3, scale: 2

      t.timestamps
    end
  end
end
