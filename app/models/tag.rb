class Tag < ActiveRecord::Base
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags

  enum tag_type: [:main_tag, :issue, :other_tag]
  enum status: [:draft, :publish]
  accepts_nested_attributes_for :post_tags, allow_destroy: true

  scope :issue_tag, -> { where(tag_type: 1) }
  scope :main_tag, -> { where(tag_type: 0) }
  scope :online_tag, -> {  }

  def self.tag_type_attributes_for_select
    tag_types.map do |tag_type, _|
      [I18n.t("enum.tag.tag_type.#{tag_type}"), tag_type]
    end
  end
  def self.status_attributes_for_select
    statuses.map do |status, _|
      [I18n.t("enum.tag.status.#{status}"), status]
    end
  end


end
