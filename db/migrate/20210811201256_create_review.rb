class CreateReview < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :name
      t.string :title
      t.string :description
      t.integer :score
    end
  end
end
