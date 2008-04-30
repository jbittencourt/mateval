class Planning < ActiveRecord::Base
  has_many :parameters
  belongs_to :user
  has_one :subject
  has_one :classroom
end
