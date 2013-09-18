class Location < ActiveRecord::Base
  has_many :location_based_datas
end
