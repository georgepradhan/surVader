class Survey < ActiveRecord::Base
  belongs_to :user 
  alias_attribute :creator, :user #lines 2-3 can be refactored into one line, use :class_name
  has_many :takers #this is the association to the join (:user_surveys)
  # establish the association to the users/takers through the join, can alias :users to :takers
  # also look into the :dependent => :destroy option
  # http://guides.rubyonrails.org/association_basics.html (section 4.1.2.4)
  has_many :questions

  #add validations

  def takers_names  # probably a better name for this.
    self.takers.map(&:user)
  end
  # ^ will need to be rewritten with the association/schema changes, but this is nice
end
