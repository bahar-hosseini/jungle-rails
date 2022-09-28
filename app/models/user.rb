# frozen_string_literal: true

class User < ActiveRecord::Base

  has_secure_password
  validates :name, presence: true, confirmation: { case_sensitive: false }
  validates :email, presence: true, confirmation: { case_sensitive: false }, uniqueness: true
  validates :password, presence: true, length: { minimum: 7 }
  validates :password_confirmation, presence:true

  def self.authenticate_with_credentials(email, password)
    u=email.delete(' ')
    user = User.find_by(email: u.downcase)
 if user.authenticate(password)
  return user
 else nil
  end
end


end
