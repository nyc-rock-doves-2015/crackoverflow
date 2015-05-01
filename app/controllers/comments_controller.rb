class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @answer = Post.find(params[:answer_id])
  end

  def create
    answer = Post.find(params[:answer_id])
    question = answer.question

    if current_user # must refactor
      Comment.create(content: params[:comment][:content], user_id: current_user.id, post_id: params[:answer_id])
    else
      set_flash("You must be logged in")
    end

    redirect_to question_path(question)
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