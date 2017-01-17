class Post < ActiveRecord::Base
  extend Enumerize
  belongs_to :user

  enum status: [:draft, :publish]
  enum file_type: [:has_cover, :has_video]
  enumerize :category, in: [:news, :special_column, :viewpoint, :behind_the_scenes, :media], scope: true
  mount_uploader :cover, CoverUploader

  def self.status_attributes_for_select
    statuses.map do |status, _|
      [I18n.t("enum.post.status.#{status}"), status]
    end
  end

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%") 
  end
end
