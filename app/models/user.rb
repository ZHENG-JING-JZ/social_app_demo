class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts
  has_many :likes

  def likes?(post)
    like_of_post(post).present?
  end

  def like_of_post(post)
    Like.find_by(post_id: post.id, user_id: self.id)
  end
end
