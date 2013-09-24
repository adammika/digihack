class Project < ActiveRecord::Base
  belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  has_many :memberships, dependent: :destroy
  has_many :members, :class_name => 'User', :through => :memberships, :source => :user
  has_many :comments, dependent: :destroy

  attr_accessible :description, :title

  validates :title, :presence => true
end
