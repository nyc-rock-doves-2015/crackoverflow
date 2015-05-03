class VotesController < ApplicationController

  def upvote
    if current_user && vote_doesnt_exist?
      create_vote(true)
      current_post.update_reputation("up")
    end
    return_reputation
  end

  def downvote
    if current_user && vote_doesnt_exist?
      create_vote(false)
      current_post.update_reputation("down")
    end
    return_reputation
  end

  def create_or_update
    if current_user
      p params
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

  def return_reputation
    render partial: 'votes/reputation', layout: false, locals: {post: current_post}
  end

  def current_post
    Post.find(params[:format])
  end

  def vote_doesnt_exist?
    PostVote.where(user_id: current_user.id, post_id: current_post.id).empty?
  end

  def create_vote(arg)
    PostVote.create(user_id: current_user.id, post_id: current_post.id, vote: arg)
  end

  private

  def to_boolean(str)
    str == 'true'
  end
end
