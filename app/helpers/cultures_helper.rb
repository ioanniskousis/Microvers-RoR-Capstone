module CulturesHelper
  def get_object(user, partial = nil)
    case partial
    when 'followings'
      list = user.followeds.select(:follower_id)
      User.all.where(id: list)
    when 'followers'
      list = user.followers.select(:followed_id)
      User.all.where(id: list)
    else
      Culture.all.order(:created_at).reverse_order
    end
  end

  def get_user_by_id(id)
    User.find(id)
  end

  def tweets_counter(user)
    user.cultures.count
  end
end
