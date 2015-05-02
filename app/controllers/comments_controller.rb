class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @question_or_answer = Post.find(params[:post_id])
  end

  def create
    question_or_answer = Post.find(params[:post_id])

    if current_user
      Comment.create(content: params[:comment][:content], user_id: current_user.id, post_id: params[:post_id])

      if question_or_answer.question_id
        redirect_to question_path(question_or_answer.question)
      else
        redirect_to question_path(question_or_answer)
      end
    else
      set_flash('You must be logged in')
      redirect_to new_sessions_path
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
