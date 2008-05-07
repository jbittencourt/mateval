class Subscription < ActiveRecord::Base
  belongs_to :user, :polymorphic => true
  belongs_to :subject
end
