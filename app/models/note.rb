class Note < ActiveRecord::Base

  belongs_to(
  :user,
  foreign_key: :user_id,
  primary_key: :id,
  class_name: "User"
  )

  belongs_to(
  :track,
  foreign_key: :track_id,
  primary_key: :id,
  class_name: "Track"
  )
end
