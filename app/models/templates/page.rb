require 'model_extension'
class Templates::Page < ActiveRecord::Base
  belongs_to :template
  has_many :site_pages
  include ModelExtension
end
