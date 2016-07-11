class CreateSpecialDays < ActiveRecord::Migration
  def change
    create_table :special_days do |t|
      t.string :name
      t.datetime :when

      t.timestamps null: false
    end
  end
end