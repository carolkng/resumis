class PostCategory < ActiveRecord::Base
  has_many :post_category_joinings, dependent: :destroy
  has_many :posts, through: :post_category_joinings

  # we belong to user and are treated as an object of a tenant
  belongs_to :user
  acts_as_tenant(:user)

  default_scope { order(name: :asc) }

  # nice slugs from category name
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  validates :name, presence: true
  validates_uniqueness_to_tenant :name
end
