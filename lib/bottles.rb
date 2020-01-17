class Bottles
  def song()
    verses(99,0)
  end

  def verse(start)
    bottle_number = BottleNumber.new(start)
    bottle_number.verse()
  end

  def verses(start, finish)
    song = ""
    bottle_number = BottleNumber.new(start)
    loop do
      puts start, finish
      song += bottle_number.verse
      if start == finish
        break
      end
      start -= 1
      song += "\n"
    end
    song
  end

end

class BottleNumber
  def initialize(number)
    @num = number
  end

  def bottleCount(n)
    word = "bottles"
    phrase = ""
    if n == 1
      word = "bottle"
    end
    phrase = "#{n} #{word}"

    if n == 0
      phrase = "no more bottles"
    end 
    phrase
  end

  def pronoun()
    called = "one"
    if @num == 1 
      called = "it"
    end
    called
  end

  def firstPart()
    "#{bottleCount(@num).capitalize()} of beer on the wall, #{bottleCount(@num)} of beer.\n"
  end

  def secondPart()
    v = "Take #{pronoun} down and pass it around, #{bottleCount(@num-1)} of beer on the wall.\n"
    if @num == 0
      v = "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
    v
  end

  def verse()
    v = firstPart + secondPart
    @num -= 1
    v
  end
end

