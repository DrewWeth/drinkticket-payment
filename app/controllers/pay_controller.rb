class PayController < ApplicationController
    protect_from_forgery with: :null_session

    def show
        @item = Item.find(params[:id])
    end

    def handlePayment
        puts "*********** BODY ***********"
        input = JSON.parse request.body.read

        payer_status = input["status"]
        our_status = payer_status == "COMPLETED" ? "UNCONFIRMED" : "ERROR"

        receipt = Receipt.create( 
            status: our_status,
            user_email: input["payer"]["email_address"],
            amount: input["purchase_units"].map{ |u| u["amount"]["value"] }.sum,
            payer_id: input["payer"]["payer_id"],
            source_transaction_id: input["id"],
            pay_source_status: payer_status
            pay_source: 'paypal',
            data: input
        )

        redirect_to receipt
    end
end
