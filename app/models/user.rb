class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :serial_number, uniqueness: true
  validates_format_of :serial_number, with: /\A[0-9a-zA-Z]*\z/
  validates :serial_number, :name, :email, presence: true
  validates :password, :password_confirmation, presence: true, on: :create
  validates :password, confirmation: true

  enum receipt_state: [:fundation_checking, :sent]
  enum gender: [:female, :male, :other]
  enum role: [:supporter, :admin]
  enum current_state: [:havent_paid, :payment_needs_confirmation, :confirmed_payment, :associated_with_children, :payment_over_due]

  has_many :children, foreign_key: :supporter_id
  has_many :messages
  accepts_nested_attributes_for :children

  mount_uploader :receipt_url, PictureUploader

  def first_child
  	children.first
  end

  def self.role_attributes_for_select
    roles.map do |role, _|
      [I18n.t("enum.user.role.#{role}"), role]
    end
  end

end
