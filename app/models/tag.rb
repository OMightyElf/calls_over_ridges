class Tag < ActiveRecord::Base
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags
  accepts_nested_attributes_for :post_tags, allow_destroy: true
end
