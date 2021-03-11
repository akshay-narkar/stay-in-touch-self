class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: :User
  validates_uniqueness_of :user, scope: %i[friend]
  validates_uniqueness_of :friend, scope: %i[user]

  # scope :past, -> { where('eventdate <=  ?', current_user.id) }
  # scope :friendlist, lambda {
  #                      where('user_id > ?', current_user.id).or(where('friend_id > ?', current_user.id))
  #                        .and(where('status == ?', 1))
  #                    }
  scope :friendlist, -> { where('status = ?', true) }
  scope :waiting, -> { where('status = ?', false) }
  # OR ('friend_id > ?',current_user.id)) AND ('status == ?',1 )) }
  # scope :past, -> { where('eventdate <=  ?', Date.today) }
  # Post.where(id: 1).or(Post.where(id: 2))

  # # def isfriend?
  #         @awaitng = (Friendship.where('friend_id = ?', current_user.id)).waiting
  # end

  # def awaitingconf

  # end

  def await(current_user, user)
    x = Friendship.where('friend_id = ?', current_user.id).and(Friendship.where('user_id = ?', user.id)).waiting
    x1 = Friendship.where('friend_id = ?', user.id).and(Friendship.where('user_id = ?', current_user.id)).waiting

    x2 = x + x1

    x2.empty? ? nil : x2
  end

  def friendss(current_user, user)
    y = Friendship.where('friend_id = ?', current_user.id).and(Friendship.where('user_id = ?',
                                                                                user.id)).friendlist

    y1 = Friendship.where('friend_id = ?', user.id).and(Friendship.where('user_id = ?', current_user.id)).friendlist

    y2 = y + y1

    y2.empty? ? nil : y2
  end

  def pendingreq(currentuser)
    Friendship.where('friend_id = ?', currentuser.id).waiting
  end
end
