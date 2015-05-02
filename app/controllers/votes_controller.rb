class VotesController < ApplicationController

  def upvote
    if current_user && vote_doesnt_exist?
      create_vote(true)
      current_post.update_reputation("up")
    end
    redirect
  end

  def downvote
    if current_user && vote_doesnt_exist? 
      create_vote(false)
      current_post.update_reputation("down")
    end
    redirect
  end

  def redirect
    if current_post.question_id == nil
      redirect_to question_path(current_post)
    else
      redirect_to question_path(current_post.question)
    end
  end

  def current_post
    Post.find(params[:format])
  end

  def vote_doesnt_exist?
    if PostVote.where(user_id: current_user.id, post_id: current_post.id).empty?
      true
    else
      false
    end
  end

  def create_vote(arg)
    PostVote.create(user_id: current_user.id, post_id: current_post.id, vote: arg)
  end
end