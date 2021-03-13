class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: :User
  validates_uniqueness_of :user, scope: %i[friend]
  validates_uniqueness_of :friend, scope: %i[user]

  # scope :friendlist, -> { where('status = ?', true) }
  scope :waiting, -> { where('status = ?', false) }

  after_update :create_friend

  def await(current_user, user)
    x = Friendship.where('friend_id = ?', current_user.id).and(Friendship.where('user_id = ?', user.id)).waiting
    x1 = Friendship.where('friend_id = ?', user.id).and(Friendship.where('user_id = ?', current_user.id)).waiting

    x2 = x + x1

    x2.empty? ? nil : x2
  end

  def friendss(current_user, user)
    # y = Friendship.where('friend_id = ?', current_user.id).and(Friendship.where('user_id = ?',
    #                                                                             user.id)).friendlist

    # y1 = Friendship.where('friend_id = ?', user.id).and(Friendship.where('user_id = ?', current_user.id)).friendlist

    # y2 = y + y1

    y2 = current_user.friendships

    y2.empty? ? nil : y2
  end

  def pendingreq(currentuser)
    Friendship.where('friend_id = ?', currentuser.id).waiting
  end

  private 

  def create_friend
    Friendship.create(status: true, friend_id: self.user_id, user_id: self.friend_id)
  end

end
