class User < ActiveRecord::Base
  has_secure_password

  validates :fname, presence: true
  validates :lname, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  before_save :email_to_lowercase

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email((email.strip).downcase)
    if (user && user.authenticate(password))
      user
    end
  end

  def email_to_lowercase
    self.email.downcase!
  end
  
end
