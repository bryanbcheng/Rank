class List < ActiveRecord::Base
  validates :name, :presence => true

  has_many :items
end
