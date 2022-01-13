class ChatwindowController < ApplicationController
  def index
    @questions = Question.all
    @answers = Answer.all
    # @greetings = Greeting.all
    # @funfacts = Funfact.all
    @current = 1
    @current_question = @questions.find(@current)
    @current_answer_a = @answers.find(@current)
    @current_answer_b = @answers.find(@current + 1)
    @current_answer_c = @answers.find(@current + 2)
  end
  def next
    @current += 1
    @current_question = @questions.find(@current)
    @current_answer_a = @answers.find(@current)
    @current_answer_b = @answers.find(@current + 1)
    @current_answer_c = @answers.find(@current + 2)
  end
end
