class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]
      @questions = Post.search(params[:search])
    elsif params[:sort_by]
      @questions = Post.filter(params[:sort_by])
    else
      @questions = Post.where(question_id: nil).order(reputation: :desc)
    end
  end

  def new
    @question = Post.new
  end

  def create
    question = Post.new(question_params)
    question.user = current_user
    if current_user && question.save
      redirect_to root_path
    else
      redirect_to new_question_path
    end
  end

  def show
    @answer = @question.answers.build
  end

  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to question_path
    else
      redirect_to edit_question_path
    end
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end

  def set_best
    question = Post.find(params[:id])
    if question.best_answer_id
      Post.find(question.best_answer_id).update(best: false)
    end
    best_answer_id = params[:answer_id]
    question.update(best_answer_id: best_answer_id)
    Post.find(best_answer_id).update(best: true)
    head :ok
  end

  private

  def set_question
    @question = Post.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content, :all_tags)
  end

end
