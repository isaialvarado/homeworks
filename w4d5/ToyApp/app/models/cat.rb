class Cat < ActiveRecord::Base
  include Toyable
  validates :name, presence: true
end
