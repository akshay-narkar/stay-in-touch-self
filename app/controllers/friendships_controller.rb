class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build(params_new)
    if @friendship.save
      redirect_to root_path, notice: 'Friend Request Sent'
    else
      redirect_to root_path, alert: 'Request Already sent'
      # can change display of sent request if already sent
    end
  end

  def new; end

  def show
    @waitingfriendships = current_user.friendships.waiting
    @awaitng = Friendship.where('friend_id = ?', current_user.id).waiting
  end

  def destroy
    delete = Friendship.find_by_id(delete_params[:id])
    if delete.destroy
      redirect_to friendship_path(current_user.id), method: :get, notice: 'Request Declined'
    else
      redirect_to friendship_path(current_user.id), method: :get, notice: 'Failed to decline. Please try again'
    end
  end

  def update
    record = Friendship.find_by_id(update_params[:id])
    if record.update(update_params)
      redirect_to friendship_path(current_user.id), method: :get, notice: 'Request Accepted'
    else
      redirect_to friendship_path(current_user.id), method: :get, notice: 'Failed to Accept. Please try again'
    end
  end

  private

  def params_new
    params.permit(:friend_id)
  end

  def delete_params
    params.permit(:id)
  end

  def update_params
    params.permit(:id, :status)
  end
end
