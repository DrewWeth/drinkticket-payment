class HomeController < ApplicationController
    def maggie
        @qr = RQRCode::QRCode.new("Hi Maggie! - Love, Drew")
    end
    
end
