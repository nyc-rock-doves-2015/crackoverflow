class QuestionsController < ApplicationController

  before_action :set_question, only: [:show, :edit, :update, :destroy]

  def index
    if params[:sort_by] == 'newest'
      @questions = Post.where(question_id: nil).order('created_at desc')
    elsif params[:sort_by] == 'oldest'
      @questions = Post.where(question_id: nil).order('created_at asc')
    elsif params[:sort_by] == 'unanswered'
      all_questions = Post.where(question_id: nil).order(reputation: :desc)
      unanswered_questions = all_questions.select do |question|
        question.answers.count == 0
      end
      @questions = unanswered_questions
    elsif params[:search]
      @questions = Post.search(params[:search])
    else
      @questions = Post.where(question_id: nil).order(reputation: :desc)
    end
  end

  def load_suggestions
    @suggestions = []
    Post.where(question_id: nil).each do |question|
      @suggestions << question.title
    end 
    render json: @suggestions
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

  private

  def set_question
    @question = Post.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :content, :all_tags)
  end

end
