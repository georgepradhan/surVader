class Taker < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey

  #add validations
end
