class SignUser
  attr_accessor :email, :password

  def self.find_by_email(email)
    
    R::SIGN_USERS.each do |user_attr|
      if user_attr[:email] == email
        return SignUser.new(email, user_attr[:password])
      end
    end

    return nil
  end

  def initialize(email, password)
    @email = email
    @password = password
  end

  def auth?
    R::SIGN_USERS.each do |user_attr|
      if user_attr[:email] == email
        if !password.blank? && user_attr[:password] == password
          return true
        end
      end
    end
    return false
  end

end