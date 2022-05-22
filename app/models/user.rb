# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  code                   :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  last_name              :string
#  locale                 :string
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  role                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :code, presence: true
  has_many :messages

  self.per_page = 15

  has_and_belongs_to_many :section_classes
  def admin?
    role == 'admin'
  end

  def lecturer?
    role == 'lecturer'
  end

  def manage?
    role == 'manage'
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
