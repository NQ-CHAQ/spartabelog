class Restaurant < ActiveRecord::Base
has_many :reviews
has_many :users , through: :reviews

  def avg_point
   self.reviews.average(:point)
  end
end
