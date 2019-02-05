class Stock < ApplicationRecord
    
    def self.new_from_lookup(ticker)
        looked_up_stock = StockQuote::Stock.quote(ticker)
        new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.previous_close)
    end 
    
end
