class Material < ActiveRecord::Base
  has_many :location_based_datas, as: :locationable
  has_many :locations, through: :location_based_datas
end
