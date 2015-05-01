class VotesController < ApplicationController
  def upvote
    PostVote.create(user_id: current_user.id, post_id: current_post.id, vote: true)
    current_post.update_reputation("up")
    redirect_to question_path(current_post)
  end

  def downvote
    PostVote.create(user_id: current_user.id, post_id: current_post.id, vote: false)
    current_post.update_reputation("down")
    redirect_to question_path(current_post)
  end
end