class Track < ActiveRecord::Base

  belongs_to(
  :album,
  foreign_key: :album_id,
  primary_key: :id,
  class_name: 'Album'
  )

  has_many(
  :notes,
  foreign_key: :track_id,
  primary_key: :id,
  class_name: 'Note'
  )

end
