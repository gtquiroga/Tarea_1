require "faraday"
require "json"

#esta clase realiza y maneja la coneccion a 
#la API de Buda
class ApiConnection

    def initialize
        @base_uri = "https://www.buda.com/api/v2"
        @conn = Faraday.new(@base_uri)
    end

    def makeRequest(path)
        uri = @base_uri + path
        response = @conn.get(uri).body
        return JSON.parse(response)
    end
end