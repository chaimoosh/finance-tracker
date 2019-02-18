class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks
    
    def self.find_by_ticker(ticker_symbol)
       where(ticker: ticker_symbol).first 
    end
    
    def self.new_from_lookup(ticker)
        begin
            looked_up_stock = StockQuote::Stock.quote(ticker)
            new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.previous_close)
        rescue Exception => e 
            return nil
        end
    end 
    
end
