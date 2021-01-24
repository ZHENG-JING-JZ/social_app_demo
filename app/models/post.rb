class Post < ApplicationRecord
  belongs_to :user
  has_many :likes

  def number_of_likes
    self.likes.count
  end
end
