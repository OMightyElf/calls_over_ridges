class Post < ActiveRecord::Base
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  accepts_nested_attributes_for :post_tags, allow_destroy: true


  enum status: [:draft, :permit, :publish]
  mount_uploader :cover, CoverUploader


  def self.status_attributes_for_select
    statuses.map do |status, _|
      [I18n.t("enum.post.status.#{status}"), status]
    end
  end
end
