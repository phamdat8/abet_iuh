class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :code, presence: true

  has_and_belongs_to_many :section_classes
  def admin?
    role == 'admin'
  end

  def lecturer?
    role == 'lecturer'
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end