class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum current_receipt_state: [:no_receipt_needed, :fundation_checking, :sent]
  enum gender: [:other, :male, :female]
  has_many :children, foreign_key: :supporter_id

  def first_child
  	children.first
  end
end
