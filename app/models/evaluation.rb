class Evaluation < ActiveRecord::Base
  belongs_to :student
  has_one :parameter
  has_one :planning
end
