class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: :User
  validates_uniqueness_of :user, scope: %i[friend]
  # scope :past, -> { where('eventdate <=  ?', current_user.id) }
  # scope :friendlist, lambda {
  #                      where('user_id > ?', current_user.id).or(where('friend_id > ?', current_user.id))
  #                        .and(where('status == ?', 1))
  #                    }
  scope :friendlist, -> {where('status = ?', true)}
  scope :waiting, -> {where('status = ?', false)}
  # OR ('friend_id > ?',current_user.id)) AND ('status == ?',1 )) }
  # scope :past, -> { where('eventdate <=  ?', Date.today) }
  # Post.where(id: 1).or(Post.where(id: 2))
end
