require_relative 'config/environment'

class App < Sinatra::Base

  get "/reversename/:name" do
    "#{params[:name].reverse}"
  end

  get "/square/:number" do
    "#{params[:number].to_i ** 2}"
  end

  get "/say/:number/:phrase" do
    @num = params[:number].to_i
    @phrases = []
    @num.times do
      @phrases << params[:phrase]
    end
    @phrases.join("\n")
  end

  get "/say/:word1/:word2/:word3/:word4/:word5" do
    @words = [params[:word1], params[:word2], params[:word3], params[:word4], params[:word5]]
    "#{@words.join(" ") + "."}"
  end

  get "/:operation/:number1/:number2" do
    @op = params[:operation]
    @numbers = [params[:number1].to_i, params[:number2].to_i]
    case @op
    when "add"
      "#{@numbers.inject(:+)}"
    when "subtract"
      "#{@numbers.inject(:-)}"
    when "multiply"
      "#{@numbers.inject(:*)}"
    when "divide"
      "#{@numbers.inject(:/)}"
    end
  end
end
