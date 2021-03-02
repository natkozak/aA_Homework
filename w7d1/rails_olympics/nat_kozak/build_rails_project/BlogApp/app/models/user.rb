class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :comments,
    foreign_key: :author_id,
    class_name: :Comment

  has_many :blogs,
    foreign_key: :author_id,
    class_name: :Blog

  has_many :comments_on_blogs,
    source: :comments,
    through: :blog
  
  has_many :blogs_commented_on,
    source: :blogs,
    through: :comments
end
