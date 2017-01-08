class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  enum receipt_state: [:fundation_checking, :sent]
  enum gender: [:other, :male, :female]
  enum role: [:supporter, :admin]
  enum current_state: [:havent_paid, :payment_needs_confirmation, :confirmed_payment, :associated_with_children, :payment_over_due]

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
