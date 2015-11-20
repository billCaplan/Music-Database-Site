class Band < ActiveRecord::Base
has_many(
:albums,
foreign_key: :band_id,
primary_key: :id,
dependent: :destroy,
class_name: 'Album'
)

has_many(
:songs,
through: :albums,
source: :tracks
)

end
