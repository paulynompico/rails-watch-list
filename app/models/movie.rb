class Movie < ApplicationRecord
  has_many :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true

  def self.search(search)
    if search
      movie = Movie.find_by(title: search)
        if movie
          self.where(id: movie)
        else
          @movies = Movie.all
        end
    else
      @movies = Movie.all
    end
  end
end
