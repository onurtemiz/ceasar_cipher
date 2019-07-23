# frozen_string_literal: true

require 'sinatra'

class Ceasar
  def self.shift(str, shiftN, letters = ('a'..'z').to_a)
    translated = []
    str.split('').each do |i|
      letters.include?(i.downcase) ? translated.push(shifted(i, shiftN, letters)) : translated.push(i)
    end
    translated.join('')
  end

  def self.shifted(i, shiftN, letters)
    location = letters.index(i.downcase)
    shift_num = location + shiftN
    shift_num -= letters.length while shift_num >= letters.length
    i.downcase == i ? letters[shift_num] : letters[shift_num].upcase
  end
end
result = nil

get '/' do
  erb :index, locals: {result: result}
end

post '/' do
  result = Ceasar.shift(params[:string],params[:n].to_i)
  redirect '/'
end


