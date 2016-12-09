class Corgi < ActiveRecord::Base
  include Toyable
  validates :name, presence: true
end
