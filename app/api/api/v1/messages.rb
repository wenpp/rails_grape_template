module API::V1
	class Messages < Grape::API
		version 'v1', using: :path

		namespace :messages do
			desc "get user all message"
			
			get '/' do
				authenticated_user.messages.to_json
			end
		end
	end 
end