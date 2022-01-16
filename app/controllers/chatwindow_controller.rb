class ChatwindowController < ApplicationController
  layout 'application'
  $questions = Question.all
  $answers = Answer.all
  $count_q = 1
  $count_a = 0
  def index
    $count_q = 1
    $count_a = 0
    @current_question = $questions.find($count_q)
    @current_answer_a = $answers.find($count_a + 1)
    @current_answer_b = $answers.find($count_a + 2)
    @current_answer_c = $answers.find($count_a + 3)
  end

  def next
    @current_question = $questions.find($count_q)
    @current_answer_a = $answers.find($count_a + 1)
    @current_answer_b = $answers.find($count_a + 2)
    @current_answer_c = $answers.find($count_a + 3)
    $count_q += 1
    $count_a += 3
  end
end
