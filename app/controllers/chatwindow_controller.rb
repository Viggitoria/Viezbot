class ChatwindowController < ApplicationController

  layout 'application'
  def index
    @questions = Question.all
    @current_question = @questions.find(1)
    @answers = Answer.select(:id, :body).where(belongs_to: @current_question.id)
    @current_answer_a = @answers.first
    @current_answer_b = @answers.find(@current_answer_a.id + 1)
    @current_answer_c = @answers.last
  end

  def next
    @questions = Question.all
    @answers = Answer.select(:id, :body).where(belongs_to: params[:value].to_i + 1)
    @current_question = @questions.find(params[:value].to_i + 1)
    @current_answer_a = @answers.first
    @current_answer_b = @answers.find(@current_answer_a.id + 1)
    @current_answer_c = @answers.last
  end
end
