class PayController < ApplicationController
    protect_from_forgery with: :null_session

    def show
        @item = Item.find(params[:id])
    end

    def handlePayment
        @item = Item.find(params[:id])
        puts "*********** BODY ***********"
        puts request.body.read
    end
end
