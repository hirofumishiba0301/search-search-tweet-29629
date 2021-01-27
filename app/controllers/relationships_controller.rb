class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:relationship][:follow_id])
    current_user.follow_create!(@user)
    redirect_to @user
  end

  def destroy
    @user = Relationship.find(params[:id]).follow
    current_user.follow_destroy!(@user)
    redirect_to @user
  end
end
