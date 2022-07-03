class Question
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @sum = @num1 + @num2
  end

  def ask_question(name)
    puts "#{name}: What does #{@num1} plus #{@num2} equal"
  end

  def check_answer?(input)
    @sum == input
  end

  def new_question(player)
    ask_question(player.name)
    print "> "
    answer = $stdin.gets.chomp
    if check_answer?(answer.to_i)
      puts "Yes! You are correct."
    else
      puts "Seriously? No!"
      player.take_life
    end
  end

end