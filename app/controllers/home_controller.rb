class HomeController < ApplicationController
    def maggie
        @qr = RQRCode::QRCode.new("Hi Maggie! - Love, Drew")
    end
    

    def debug
        puts "============ DEBUG ============"
        puts params
    end
end
