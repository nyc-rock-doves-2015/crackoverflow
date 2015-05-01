class VotesController < ApplicationController

  def upvote
    if vote_doesnt_exist?
      create_vote(true)
      current_post.update_reputation("up")
    end
    redirect_to question_path(current_post)
  end

  def downvote
    if vote_doesnt_exist?
      create_vote(false)
      current_post.update_reputation("down")
    end
    redirect_to question_path(current_post)
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