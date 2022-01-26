class GreetingController < ApplicationController
  def conversation_start
    @first_question =
      'Hallo, ich bin Volker, der Viezexperte.
      Hast du Lust auf ein kleines Quiz,
      um dein Viez Wissen zu testen? 🍎'
    @first_answer_a = 'Ja.'
    @first_answer_b = 'Nein.'
  end
end
