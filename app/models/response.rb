class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :choice
  has_one :question, through: :choice

  # validates presence of choice
end
