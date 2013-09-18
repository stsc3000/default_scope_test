require 'test_helper'

class LocationBasedMetaDataTest < ActiveSupport::TestCase

  test "A: joining with materials" do
    location_based_meta_data_material_association
  end

  test "B: joining materials with squeel" do
    require 'squeel'
    location_based_meta_data_material_association
  end

  def location_based_meta_data_material_association
    material = Material.create(name: "Dough")
    location = Location.create(name: "Pizza Factory")
    material.locations << location
    location_based_data = material.location_based_datas.first
    location_based_meta_data = LocationBasedMetaData.create(name: "Needs to be mixed")
    location_based_data.location_based_meta_datas << location_based_meta_data

    assert(
      location_based_meta_data.material == material
    )

    assert(
      LocationBasedMetaData.joins(:material).where("materials.name" => "Dough").to_a[0] ==
      location_based_meta_data
    )

  end

end
