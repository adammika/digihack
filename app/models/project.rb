class Project < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  has_many :memberships
  has_many :users, :through => :memberships

  attr_accessible :description, :title
end
