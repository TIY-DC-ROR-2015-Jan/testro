class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :metro

  validates_presence_of :user, :metro
  validates_uniqueness_of :metro, scope: :user
end
