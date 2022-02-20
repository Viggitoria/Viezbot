module ChatwindowHelper

  def load_random_fact
    @new_num = rand(@fun_fact.first.id..@fun_fact.last.id)
    @rand_fact = @fun_fact.find(@new_num)
    @rand_fact.body

  end
end
