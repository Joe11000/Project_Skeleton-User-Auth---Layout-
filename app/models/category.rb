class Category < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  validates :title, presence: true, length: { minimum: 2 }
end
