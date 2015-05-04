class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @question_or_answer = Post.find(params[:post_id])
  end

  def create

    post = Post.find(params[:post_id])

    # Rails has this handy thing here...
    #
    # respond_to do |format|
    #   format.html
    #   format.js
    # end

    if request.xhr? # It's unusual to see this guy in rails code....
      if current_user
        comment = Comment.create(content: params[:comment][:content], user_id: current_user.id, post: post)
        render partial: 'show', locals: {comment: comment}
      else
        set_flash('You must be logged in')
        head :unauthorized
      end
    else
      if current_user
        comment = Comment.create(content: params[:comment][:content], user_id: current_user.id, post: post)
        redirect_to question_path(post.question) if post.question_id
        redirect_to question_path(post)
      else
        set_flash('You must be logged in')
        redirect_to new_sessions_path
      end
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
