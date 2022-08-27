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
class Photo < ApplicationRecord
  validates :title, presence: true
  validates :image_url, presence: true, format: { with: /.\.(png|jpeg|jpg|gif)/ }
end
