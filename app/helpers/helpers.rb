require 'sinatra/base'
class Helpers
    #accept the session hash as an argument
    #use the user_id from the session hash to find the user in the database and return that user.
    def self.current_user(session)
          @user = User.find_by_id(session[:user_id])
    end
      #accept the session hash as an argument
      #This method should return true if the user_id is in the session hash and false if not.
    def self.is_logged_in?(session)
          !!session[:user_id]
    end
    
end