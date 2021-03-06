class Song  <ActiveRecord::Base

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres


  def slug
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, ' ')
  end

  def self.find_by_slug(name)
    Song.all.find do |song|
      song.slug == name
    end
  end



end
