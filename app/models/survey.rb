class Survey < ActiveRecord::Base
  belongs_to :user 
  alias_attribute :creator, :user
  has_many :takers
  has_many :questions

  def takers_names  # probably a better name for this.
    self.takers.map(&:user)
  end

end
