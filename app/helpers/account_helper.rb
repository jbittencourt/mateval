module AccountHelper
  #Returns true or false if the user is a admin.
    def is_admin?
      current_user.roles.each do |role|
        return true if role.title.downcase == "admin" 
      end
      return false
    end
    
    #Returns true or false if the user is a admin.
    def is_prof?
      current_user.roles.each do |role|
        return true if role.title.downcase == "prof" 
      end
      return false
    end
end
