class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.integer :author_id
      t.string :level
      t.integer :language_id
      t.integer :year_published
      t.string :description
      t.integer :pages
      t.string :type
      t.string :image

      t.timestamps
    end
  end
end
