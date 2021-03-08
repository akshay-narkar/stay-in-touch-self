module PostHelper
  def display_errors(post)
    return unless post.errors.full_messages.any?

    content_tag :p, "Post could not be saved. #{post.errors.full_messages.join('. ')}", class: 'errors'
  end

  def posthelper(currentuser, post, friendobject)
    if currentuser == post.user
      render partial: 'posts/friendspost', locals: { post: post }

    elsif friendobject.friendss(currentuser, post.user)
      render partial: 'posts/friendspost', locals: { post: post }
    end
  end
end
