class User < ActiveRecord::Base
  has_many :responses
  #what about the association to :choices?
  has_many :surveys #alias to :created_surveys, use :source and :foreign_key
  #define the relationship to :user_surveys
  #define the relationship to surveys through :user_surveys and alias to :taken_surveys

  #add some validations (email format, not null, uniqueness, etc.)
 
  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


end
