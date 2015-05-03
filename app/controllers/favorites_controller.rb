class FavoritesController < ApplicationController
  def create
    @question = Post.find(params[:question_id])
    if current_user
      favorite = @question.favorites.create(user_id: current_user.id)
      render partial: 'favorite_count', locals: {question: @question}, layout: false
    else
      set_flash("Must be logged in")
      render partial: 'sessions/fail'
    end
  end

  def destroy
    question = Post.find(params[:id])
    if current_user
      favorite = question.favorites.where(user_id: current_user.id).first
      favorite.destroy if favorite
    else
      set_flash("Must be logged in")
    end

    if request.xhr?
      render partial: 'favorite_count', locals: {question: question}, layout: false
    else
      redirect_to question_path(question)
    end
  end

end
