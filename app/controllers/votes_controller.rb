class VotesController < ApplicationController

  def upvote
    if current_user && vote_doesnt_exist?
      create_vote(true)
      current_post.update_reputation("up")
    end
    # change_vote("up")
    redirect_to question_path(current_post)
  end

  def downvote
    if current_user && vote_doesnt_exist? 
      create_vote(false)
      current_post.update_reputation("down")
    end
    # change_vote("down")
    redirect_to question_path(current_post)
  end

  # def current_vote
  #   PostVote.find_by(user_id: current_user.id, post_id: current_post.id)
  # end

  # def change_vote(dir)
  #   if dir == "down" && current_vote.vote
  #     2.times do
  #       current_vote.post.update_reputation("down")
  #     end
  #     current_user.post_votes.find_by(post_id: current_post.id).update(vote: false)
  #   elsif dir == "up" && !current_vote.vote 
  #     2.times do
  #       current_vote.post.update_reputation("up")
  #     end
  #     current_user.post_votes.find_by(post_id: current_post.id).update(vote: true)
  #   end
  # end

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