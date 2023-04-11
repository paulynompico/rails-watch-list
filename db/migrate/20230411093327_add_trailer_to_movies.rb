class AddTrailerToMovies < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :trailer, :string
  end
end
