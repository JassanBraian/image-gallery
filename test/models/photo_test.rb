# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  title      :string
#  image_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class PhotoTest < ActiveSupport::TestCase
  test "should have a title value" do
    photo = Photo.new(image_url: "algo.jpg")
    assert_not photo.save
  end

  test "should have a image_url value" do
    photo = Photo.new(title: "algo.jpg")
    assert_not photo.save
  end

  test "should not save non valid image urls" do
    photo = Photo.new(title: "algo", image_url: "algo")
    assert_not photo.save
  end

  test "should save valid image urls" do
    photo = Photo.new(image_url: "algo.jpg", title: "Algo")
    assert photo.save
  end
end
