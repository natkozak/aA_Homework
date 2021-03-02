class Blog < ApplicationRecord
  validates :title, :body, presence: true
  validates :title, uniqueness: {scope: :author_id}

  has_many :comments,
    foreign_key: :blog_id,
    class_name: :Comment
  
  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User

  
end
