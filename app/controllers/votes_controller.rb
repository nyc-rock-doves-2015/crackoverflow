class VotesController < ApplicationController
  def upvote
    PostVote.create(user_id: current_user.id, post_id: current_post.id, vote: true)
    redirect_to question_path(current_post)
  end

  def downvote
    PostVote.create(user_id: current_user.id, post_id: current_post.id, vote: false)
    redirect_to question_path(current_post)
  end
end