require 'test_helper'
#Works without squeel, doesn't when squeel is included
require 'squeel'

class LocationBasedMetaDataTest < ActiveSupport::TestCase

  def check_out_location_based_meta_data_material_association
    assert(
      @location_based_meta_data.reload.material == @material
    )
  end

  def check_out_location_based_meta_data_materials_join
    assert(
      LocationBasedMetaData.joins(:material).where( materials: { name: "Dough" } ).to_a[0] ==
      @location_based_meta_data.reload
    )
  end

  def setup
    @material = Material.create(name: "Dough")
    @location = Location.create(name: "Pizza Factory")
    @material.locations << @location
    @location_based_data = @material.location_based_datas.first
    @location_based_meta_data = LocationBasedMetaData.create(name: "Needs to be mixed")
    @location_based_data.location_based_meta_datas << @location_based_meta_data
  end

  test "material association" do
    check_out_location_based_meta_data_material_association
  end

  test "joins with materials" do
    check_out_location_based_meta_data_materials_join
  end

end
