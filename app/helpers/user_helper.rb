def create_user(params)
  user = User.create(name: params[:name].downcase)
  if user.valid?
    validate_password(user, params[:password])
  else
    return 'name'
  end
end

def validate_password(user, password)
  if password.length < 6 || password.length > 15
    User.destroy(user.id)
    return 'length'
  elsif /\w*\d\w*/.match(password) == nil
    User.destroy(user.id)
    return 'number'
  else
    user.password = password
    user.save
  end
end

def login_valid?(name, password)
  user = User.where(name: name).first
  if user == nil
    false
  else
    if user.password == password
      true
    else
      false
    end
  end
end

def error_message(error)
  if error == 'name'
    return "Username is Already Taken"
  elsif error == 'number'
    return "Password must Contain a Number"
  elsif error == 'length'
    return "Password has to be Between 6\nand 14 Letters Long"
  end
end