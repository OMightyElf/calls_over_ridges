class Post < ActiveRecord::Base
  extend Enumerize
  belongs_to :user

  scope :pinned,  -> { where(pinned: true) }
  scope :without, ->(id) { where.not(id: id) if id }

  after_save :ensure_only_one_pinned_post_per_file_type

  validates :title, :subtitle, :publish_date, :content, presence: true
  validate :check_file_type

  enum status: [:draft, :publish]
  enum file_type: [:has_cover, :has_video]
  enumerize :category, in: [:news, :special_column, :viewpoint, :behind_the_scenes, :media], scope: true
  mount_uploader :cover, CoverUploader
  mount_uploader :video, VideoUploader

  def self.status_attributes_for_select
    statuses.map do |status, _|
      [I18n.t("enum.post.status.#{status}"), status]
    end
  end

  # def self.search(query)
  #   # where(:title, query) -> This would return an exact match of the query
  #   where("title like ?", "%#{query}%") 
  # end

  private

  def ensure_only_one_pinned_post_per_file_type
    if has_video?
      Post.pinned.publish.has_video.without(id).update_all(pinned: false) if pinned?
    else
      Post.pinned.publish.has_cover.without(id).update_all(pinned: false) if pinned?
    end
  end

  def check_file_type
    if has_video? && video.blank?
      errors.add(:video, '請上傳影片')
    elsif has_cover? && cover.blank?
      errors.add(:cover, '請上傳圖片')
    end
  end
end
