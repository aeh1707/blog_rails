class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_save :update_posts_counter

  validates :title, presence: true
  validates :title, length { maximum: 250 }
  validates :comments_counter, comparison { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison { greater_than_or_equal_to: 0 } 

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.last(5)
  end
end
