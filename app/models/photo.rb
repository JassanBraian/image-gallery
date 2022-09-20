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
  validates :title, presence: true, uniqueness: { message: "El titulo debe ser único" }
  validates :image_url, presence: true, format: { with: /.\.(png|jpeg|jpg|gif)/ , message: "La url no es valida"}
  scope :latest, ->(limit) { order("id desc").limit(limit) }
  scope :paginate_scope, -> (page=1, per_page=15) { order("id desc").offset((page - 1) * per_page).limit(per_page) if per_page && page }

  def self.paginate(page = 1, per_page = 15)
    Photo.order("id desc").offset((page - 1) * per_page).limit(per_page) if page && per_page
  end
end
