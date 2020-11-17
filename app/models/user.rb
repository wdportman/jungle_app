class User < ActiveRecord::Base
  has_secure_password

  before_validation :strip_input_fields


  def strip_input_fields
    self.attributes.each do |key, value|
      self[key] = value.strip if value.respond_to?("strip")
    end
  end

  validates :fname, presence: true

  validates :lname, presence: true

  validates :email, presence: true

  validates :password, presence: true
  validates_length_of :password, minimum: 8

  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email((email.strip).downcase)
    if (user && user.authenticate(password))
      user
    end
  end
  
end
