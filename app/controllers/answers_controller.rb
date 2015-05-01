class AnswersController < ApplicationController
  def new
    @question = Post.find(params[:id])
    @answer = @question.answers.build
  end

  def create
  end

  def show
  end
end