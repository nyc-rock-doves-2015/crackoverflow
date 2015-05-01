class AnswersController < ApplicationController
  def new
    @question = Question.find(:id)
    @answer = Answer.new
  end

  def create
  end

  def show
  end
end