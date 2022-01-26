class ChatwindowController < ApplicationController

  layout 'application'
  $current = 1
  def index
    @questions = Question.all
    @answers = Answer.all
  end
end
