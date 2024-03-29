# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, :uniqueness => {:case_sensitive=>false}, format: { with: VALID_EMAIL_REGEX }
  #validate :email, uniqueness_of: true
  before_save { |user| user.email = user.email.downcase }

  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

end
