class DiarioDeClassePost < ActiveRecord::Base
  has_many :comments, :as => :commentary
  acts_as_taggable
end
