class QuestionsController < ApplicationController

  def index
    @questions = Post.where(question_id: nil)
  end

  def new
    @question = Post.new
  end

  def create
    question = Post.new(question_params)
    if question.save
      redirect_to root_path
    else
      redirect_to new_question_path
    end
  end

  def show
    @question = Post.find(params[:id])
    @answer = @question.answers.new
  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end

end
