module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def notice1
    render 'layouts/noticep' if notice.present?
  end

  def alert1
    render 'layouts/alertp' if alert.present?
  end

  def devisemap(variable)
    render partial: 'layouts/devise', locals: { variable1: variable } if devise_mapping.rememberable?
  end

  def current_user1
    if current_user
      render 'layouts/currentpartial'
    else
      render 'layouts/noncurrentpartial'
    end
  end

  def checkfriend(user, show = nil)
    return 'Yourself' if (current_user.id == user.id) and show == 'show'
    return if (current_user.id == user.id) and show.nil?

    friendobject = Friendship.new

    awaiting = friendobject.await(current_user, user)
    render 'friendships/awaiting' if awaiting

    if friendobject.friendss(current_user,user)
      render 'friendships/friends'
    else
      render partial: 'friendships/onshowrequest', locals: { user: user }
    end
  end

  def checkusercurrent
    render 'layouts/showinnav' if current_user
  end
end
