class ChatwindowController < ApplicationController

  layout 'application'
  $current = 1
  def index
    @questions = Question.all
    @answers = Answer.all

    @question_array = []

    while @question_array.length < 10
      rand_num = rand(1..10)
      new_question = @questions.find(rand_num)
      @question_array.append(new_question) if @question_array.exclude?(new_question)
    end
  end
end
