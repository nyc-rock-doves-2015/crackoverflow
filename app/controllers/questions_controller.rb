class QuestionsController < ApplicationController

  def index
    @questions = Post.where(question_id: nil)
  end

end
