class ApplicationController < ActionController::Base
    helper_method :is_admin
    helper_method :format_money

    private 

    def is_admin
        current_user && current_user.is_admin
    end

    def format_money(price)
        '$%.2f' % price
    end
end
