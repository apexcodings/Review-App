class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :description
      t.integer :user_id
      t.integer :course_id

      t.timestamps
    end
  end
end
