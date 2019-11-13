class PayController < ApplicationController
    protect_from_forgery with: :null_session

    def show
        @item = Item.find(params[:id])
    end

    def handlePayment
        puts "*********** BODY ***********"
        input = JSON.parse request.body.read
        details = input["details"]
        user_id = input["userId"]

        payer_status = details["status"]
        our_status = payer_status == "COMPLETED" ? "UNCONFIRMED" : "ERROR"

        receipt = Receipt.create( 
            user_id: user_id,
            status: our_status,
            user_email: details["payer"]["email_address"],
            amount: details["purchase_units"].map{ |u| u["amount"]["value"] }.sum,
            payer_id: details["payer"]["payer_id"],
            source_transaction_id: details["id"],
            pay_source_status: payer_status,
            pay_source: 'paypal',
            data: details
        )

        redirect_to receipt
    end
end
