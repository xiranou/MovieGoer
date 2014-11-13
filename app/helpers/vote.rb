def voted?(object, user)
  object.voters.include?(user)
end