class ChatwindowController < ApplicationController

  layout 'application'

  def index
    @questions = Question.all
    @answers = Answer.all
    @current_question = $questions.find(1)
    @current_answer_a = $answers.find(1)
    @current_answer_b = $answers.find(2)
    @current_answer_c = $answers.find(3)

  end

  def next
    @current_question = $questions.find(params[:value].to_i + 1)
    @current_answer_a = $answers.find(params[:value].to_i)
    @current_answer_b = $answers.find(params[:value].to_i)
    @current_answer_c = $answers.find(params[:value].to_i)
  end
end
