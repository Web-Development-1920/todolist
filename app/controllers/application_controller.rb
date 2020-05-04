class ApplicationController < ActionController::Base
    def route_not_found
        respond_to do |format|
            format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
            format.xml  { head :not_found }
            format.any  { head :not_found }
        end
    end

    def action_not_found
        raise AbstractController::ActionNotFound.new('Not Found')
    end

    def record_not_found
        raise ActiveRecord::RecordNotFound.new('Not Found')
    end
end
