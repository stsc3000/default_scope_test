class LocationBasedData < ActiveRecord::Base
  belongs_to :location
  belongs_to :locationable, polymorphic: true
  has_many :location_based_meta_datas

  default_scope { where(deleted_at: nil) }


end
