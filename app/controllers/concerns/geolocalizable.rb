module Geolocalizable
  extend ActiveSupport::Concern

  included do
    before_action :set_country_by_ip
  end

  def set_country_by_ip
  end
end
