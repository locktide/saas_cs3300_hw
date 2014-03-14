class CreateMovies < ActiveRecord::Migration
  def up
    create_table :movies do |t|
      t.string :title
      t.string :rating
      t.text :description
      t.datetime :release_date
      #add the director field
      t.string :director
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
=begin
    add_column :director, default: true 
  end
  def change
    add_column :movies, :director, :string
  end
=end
  def down
    drop_table :movies
    remove_column :director
  end
end
