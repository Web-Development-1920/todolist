class ApplicationController < ActionController::Base
    def route_not_found
        raise ActionController::RoutingError.new('Not Found')
    end

    def action_not_found
        raise AbstractController::ActionNotFound.new('Not Found')
    end

    def record_not_found
        raise ActiveRecord::RecordNotFound.new('Not Found')
    end

    # def current_user
    #     return unless session[:user_id]
    #     @current_user ||= User.find(session[:user_id])
    # end
end
