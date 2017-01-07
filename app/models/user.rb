class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  enum current_receipt_state: [:no_receipt_needed, :fundation_checking, :sent]
  enum gender: [:other, :male, :female]
  enum role: [:supporter, :admin]

  has_many :children, foreign_key: :supporter_id
  accepts_nested_attributes_for :children

  def first_child
  	children.first
  end

  def self.role_attributes_for_select
    roles.map do |role, _|
      [I18n.t("enum.user.role.#{role}"), role]
    end
  end

end
