class TagsController < ApplicationController

  def show
    @tag = Tag.find(params[:id])
    @questions = @tag.posts.order(reputation: :desc)
  end

end
