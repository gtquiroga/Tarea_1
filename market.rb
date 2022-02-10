require "date"
require "erb"
require_relative "api_connection"



class Markets

    #El mercado y su transaccion de mayor valor se guarda en
    #markets_data de la forma [id mercado, valor]
    def initialize
        @api = ApiConnection.new
        @markets_data = []
        @markets_uri = "/markets"
        @trades_uri = "/markets/%s/trades?timestamp=%s&limit=100"
    end

    #Se obtienen los id de mercado y luego calcula la transaccion
    #de mayor valor con el metodo getHighestTrade
    def getMarketsData
        markets = @api.makeRequest(@markets_uri)
        markets["markets"].each do |market|
            market_id = market["id"]
            market_highest_trade = getHighestTrade(market_id)
            @markets_data.push([market_id, market_highest_trade])
        end
    end

    #Este metodo obtinen todas las transacciones en las ultimas 24hrs
    #calcula su valor y lo almacena en trades_list. Luego se ordena la 
    #lista y se retorna el mayor
    def getHighestTrade(market_id)
        trades_list = []
        end_timestamp = (Time.now.utc.to_f * 1000).round
        initial_timestamp = end_timestamp - 86400000
        while initial_timestamp < end_timestamp do
            uri = @trades_uri % [market_id, end_timestamp]
            trades = @api.makeRequest(uri)
            end_timestamp = trades["trades"]["last_timestamp"].to_i
            trades["trades"]["entries"].each do |trade|
                if trade[0].to_i >= initial_timestamp then
                    trades_list.push(trade[1].to_f * trade[2].to_f)
                end
            end
        end
        highest_trade = trades_list.sort.reverse[0]
        return highest_trade
    end

    def get_binding
        binding
    end

end


