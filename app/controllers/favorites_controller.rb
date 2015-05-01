class FavoritesController < ApplicationController
  def create
    @question = Post.find(params[:question_id])
    favorite = @question.favorites.create(user_id: current_user.id)

    redirect_to question_path(@question)
  end

  def destroy
    question = Post.find(params[:question_id])
    favorite = question.favorites.where(user_id: current_user.id).first
    favorite.destroy if favorite

    redirect_to question_path(question)
  end

end