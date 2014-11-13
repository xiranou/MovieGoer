def average_score(object)
  total_scores = object.ratings.map { |rating| rating.score }
  return (total_scores.inject(:+).to_f/object.ratings.size).round(1)
end