class ApplicationController < ActionController::Base
    helper_method :is_admin

    private 

    def is_admin
        current_user && current_user.is_admin
    end
end
