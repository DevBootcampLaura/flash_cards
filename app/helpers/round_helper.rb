def round_name(deck)
  return "#{deck}-#{Time.now.strftime("%H:%M")}"
end

def correct?(guess, answer)
  guess.downcase == answer.downcase ? "Correct" : "Incorrect"
end