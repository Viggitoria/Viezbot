class ChatwindowController < ApplicationController

  layout 'application'
  def index
    @questions = Question.all
    @answers = Answer.all
    @fun_fact = FunFact.all


    @question_array = []

    while @question_array.length < 10
      rand_num = rand(@questions.first.id..@questions.last.id)
      new_question = @questions.find(rand_num)
      @question_array.append(new_question) if @question_array.exclude?(new_question)
    end

    new_num = rand(@fun_fact.first.id..@fun_fact.last.id)
    @rand_fact = @fun_fact.find(new_num)

  end
end
