class Song < ActiveRecord::Base
  # add associations here
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def artist_name=(an)
    self.artist = Artist.find_or_create_by(name: an)
  end

  def note_contents=(contents)
    contents.each do |content|
      if content.strip != ""
        self.notes.build(content: content)
      end
    end
  end

  def note_contents
    self.notes.map(&:content)
  end
end
