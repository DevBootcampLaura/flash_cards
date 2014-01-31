def complete(complete, id)
  if complete == true
    return "<a href='/new'>Play a new round.</a>"
  else
    return "<a href='/game/#{Deck.where(id: id).first.name}'>Continue unfinished game!</a>"
  end
end

def correct(card, answer)
  if card.answer == answer
    return "Yah!"
  else
    return "Boo!, the correct answer is #{card.answer}"
  end
end
