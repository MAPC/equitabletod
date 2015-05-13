class ServiceType < ActiveRecord::Base
  attr_accessible :mode, :slug

  has_many :transit_lines

  before_save :set_slug

  def set_slug
    self.slug = self.mode.parameterize
  end

  def title
    self.mode.titleize
  end

end
