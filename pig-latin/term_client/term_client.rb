require 'colorize'
require 'pig_latin'

# class Piggies
#   def self.start
#     puts "Hello, I speak igpay atinlay.".colorize(:yellow)
#       puts "Type any word in english to translate...".colorize(:yellow)
#     @@user_command = gets.chomp
#     PigLatin.pig_latin(@@user_command)
#   end
# end
# Piggies.start

class Piggies
  include PigLatin
  def start
    puts "Hello, I speak igpay atinlay.".colorize(:yellow)
      puts "Type any word in english to translate...".colorize(:yellow)
    @@user_command = ""
    while (@@user_command != 'quit')
      @@user_command = gets.chomp
      result = pig_latin(@@user_command)
      puts "#{result}".colorize(:green)
    end
  end
end
Piggies.new.start

# class Piggies
#   class << self
#     include PigLatin
#   end
#   def self.start
#     puts "Hello, I speak igpay atinlay.".colorize(:yellow)
#       puts "Type any word in english to translate...".colorize(:yellow)
#     @@user_command = gets.chomp
#     pig_latin(@@user_command)
#   end
# end
# Piggies.start
