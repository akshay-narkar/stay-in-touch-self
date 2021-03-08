class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    # @friendship = Friendship.find_by_id(params[:id])
    # @friendlist = current_user.friendships.friendlist
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.ordered_by_most_recent
  end
end
