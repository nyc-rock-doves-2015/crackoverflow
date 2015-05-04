class VotesController < ApplicationController

  def create_or_update
    if current_user
      post = Post.find(params[:post_id])
      vote = PostVote.find_or_create_by(post: post, user: current_user)
      vote_boolean = to_boolean(params[:vote])

      if vote.vote.nil?
        vote.update(vote: vote_boolean)
        vote_boolean == true ? (dir = "up") : (dir = "down")
        post.update_reputation(dir)
      elsif vote.vote != vote_boolean
        vote.update(vote: vote_boolean)
        vote_boolean == true ? (dir = "up") : (dir = "down")
        2.times {post.update_reputation(dir)}
      elsif vote.vote == vote_boolean
        vote.update(vote: nil)
        vote_boolean == true ? (dir = "down") : (dir = "up")
        post.update_reputation(dir)
      end
    end
    render partial: 'votes/reputation', layout: false, locals: {post: post}
  end

  private

  def to_boolean(str)
    str == 'true'
  end
end
