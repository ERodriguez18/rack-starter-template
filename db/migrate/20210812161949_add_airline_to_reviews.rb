class AddAirlineToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :airline, foreign_key: true
  end
end
