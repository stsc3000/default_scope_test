class LocationBasedMetaData < ActiveRecord::Base
  belongs_to :location_based_data
  has_one :material, through: :location_based_data, source: :locationable, source_type: "Material"
end
