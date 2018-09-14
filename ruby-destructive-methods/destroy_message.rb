def destroy_message(message)
  if message.include? ":"
    alert = message.slice(/\A.+:/)
    return alert
  else
    nil
  end
  message
end

def destroy_message!(message)
  if message.include? ":"
    message.slice!(/(?<=:).+/)
  else
    nil
  end
  message
end

