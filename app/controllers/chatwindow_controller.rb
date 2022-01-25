class ChatwindowController < ApplicationController

  layout 'application'
  $current = 1
  def index
    @questions = Question.all
    @current_question = @questions.find($current)
    @answers = @current_question.answers

    @current_answer_a = @answers.first
    @current_answer_b = @answers.find(@current_answer_a.id + 1)
    @current_answer_c = @answers.last
    $current += 1
    $current = 1 if $current > 10
  end
end
