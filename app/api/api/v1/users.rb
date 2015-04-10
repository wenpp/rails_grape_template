module API::V1
  class Users < Grape::API
  	version 'v1', using: :path
  	format :json

  	namespace :users do
      desc "Return all user"
        post '/login' do
          authenticated_user
        end

        get '/' do
            User.all
        end
    end
  end	
end