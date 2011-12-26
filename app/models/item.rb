class Item < ActiveRecord::Base
  attr_protected :up_votes, :down_votes

  validates :name, :presence => true

  belongs_to :list
end
