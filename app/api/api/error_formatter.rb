module API::ErrorFormatter
	def self.call message, backtrace, options, env
		{:response_type=> 'error', :response=> messsage}.to_json
	end
end