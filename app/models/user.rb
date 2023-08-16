class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }


  def self.authenticate_with_credentials(email, password)
    #Converts user inputted email stripping trailling and white spaces and turns uppercase to lowercase chars.
    user = User.find_by(email: email.strip.downcase)
    user && user.authenticate(password) ? user : nil
  end
end
