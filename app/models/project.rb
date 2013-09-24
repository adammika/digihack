class Project < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  has_many :memberships
  has_many :members, :class_name => 'User', :through => :memberships, :source => :user

  attr_accessible :description, :title
end
