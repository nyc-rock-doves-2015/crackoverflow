class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :edit, :update, :destroy]

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
  end

  def edit
  end

  private

  def set_question
    @question = Post.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content)
  end

end
