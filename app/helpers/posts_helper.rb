module PostsHelper
  def path_of_like(post, page_id = 1)
    if !current_user.present?
      return "#{post.number_of_likes} likes"
    end

    if !current_user.likes?(post)
      link_to "#{post.number_of_likes} likes", post_likes_path(post_id: post.id, page_id: page_id), method: :post
    else
      like = current_user.like_of_post(post)
      link_to "#{post.number_of_likes} likes", post_like_path(like, post_id: post.id, page_id: page_id), method: :delete
    end
  end
end
