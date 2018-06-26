class DynamicMessage
  attr_accessor :message, :random_characters, :scrambled_message, :random_character_pool, :action 
  
  def initialize
    @random_characters = ''
    @random_character_pool = "!\#$%&()*0123456789:?@ABCDEFGHIJKLMNOPQRSTUVWXYZ^abcdefghijklmnopqrstuvwxyz{}"
  end

  def random_character_generator
    number_of_random_characters = rand(51)
    number_of_random_characters.times do 
    @random_characters += '<span>' + @random_character_pool[rand(76)] + '</span>'
    end
    @random_characters
  end

  def scramble
    @scrambled_message = ""
    word_array = @message.split("")
    word_array.each do |character|
      @random_characters = ''
      self.random_character_generator
      @scrambled_message += '<span hidden>' + character + '</span>' + @random_characters
    end
    @message = @scrambled_message
  end
  
 def unscramble  
    scrambled_array = @message.split("<span hidden>")
    message_characters = scrambled_array.collect {|line| line[0]}
    original_message = message_characters.join
    @message = original_message
  end

  def play 
    puts "Please enter your text"
    @message = gets.strip
    until @action == "exit"
     self.action
     puts "Your current message is:\n#{self.message}"
    end
  end

  def action
    puts "what would you like to do?(scramble/unscramble/exit)"
    @action = gets.strip
      if @action == "scramble"
        self.scramble
        
      elsif @action == "unscramble"
        self.unscramble
        
      end
  end
end

