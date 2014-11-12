def set_error(message)
  session[:error] = message
end

def display_error
  error = session[:error]
  session[:error] = nil
  return "#{error}"
end