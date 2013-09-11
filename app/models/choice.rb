class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :responses
  # also has many users through responses

  #add validations
end
