class Survey < ActiveRecord::Base
  belongs_to :user # try to alias as 'creator' etc.
  has_many :takers
  has_many :questions
end
