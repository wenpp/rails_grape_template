module API::V1
  class Users < Grape::API
	version 'v1', using: :path
	format :json



      helpers do
            def authenticated
                  user = User.find_by_username(params[:username])
                  user && user.authenticate(params[:password])
            end

            def authenticated_token
                  byebug
                  user = User.find_by_authentication_token(request.headers['Authentication-Token'])
            end
      end

	namespace :users do
      desc "Return all user"
        before do 
            error!("401 Unauthorized",401) unless authenticated
        end

        post '/login' do
          authenticated.authentication_token
        end
      end

      namespace :users do
        before do 
            error!("401 Unauthorized",401) unless authenticated_token
        end    
        get '/' do
            User.all
        end
      end
  end	
end