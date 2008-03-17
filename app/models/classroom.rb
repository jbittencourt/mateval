class Classroom < ActiveRecord::Base
  has_and_belongs_to_many :diario_de_classe_posts
  has_and_belongs_to_many :students
end
