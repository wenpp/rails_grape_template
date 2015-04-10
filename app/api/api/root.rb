module API
	class Root < Grape::API
		prefix 'api'

		before do
			error!("401 Unauthorized", 401) unless !!authenticated_user
		end

		helpers do
			def authenticated_user
		      user = User.find_by_authentication_token(request.headers['Authentication-Token'])
		      return user if !!user
		      user = User.find_by_username(params[:username])
		      user && user.authenticate(params[:password])
		    end
		end

		mount API::V1::Root #First version

		error_formatter :json, API::ErrorFormatter
	end
end