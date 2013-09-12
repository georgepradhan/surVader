class User < ActiveRecord::Base
  has_many :responses
  #what about the association to :choices?
  has_many :surveys #alias to :created_surveys, use :source and :foreign_key
  #define the relationship to :user_surveys
  #define the relationship to surveys through :user_surveys and alias to :taken_surveys

  #add some validations (email format, not null, uniqueness, etc.)
  validates :name, presence: {
    message: "Please enter yo name dawg!"
  }

  validates :email, uniqueness: {
    message: "THIS EMAIL ADDRESS ALREADY HAS AN ACCOUNT. PLZ TRY AGAIN"
  }

  validates :password, presence: {
    message: "Please enter a password"
  }

  validate :email_is_good

  def email_is_good
    if email == ""
      errors.add(:email, "email can't be blank")
    end
    unless email =~ /^.+@.+$/
      errors.add(:email, "please enter valid email address")
    end
  end


  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


end

