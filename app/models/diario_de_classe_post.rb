class DiarioDeClassePost < ActiveRecord::Base
  has_many:comments, :as => :commentary
end
