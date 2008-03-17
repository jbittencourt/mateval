class DiarioDeClassePost < ActiveRecord::Base
  has_and_belongs_to_many :students
  has_and_belongs_to_many :classrooms
end
