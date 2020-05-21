class Connection 

    BASE='https://www.alphavantage.co/query?'


    def self.api
        #makes faraday connection
        fara = Faraday.new(url: BASE) do |f|
            f.response :logger 
            f.adapter Faraday.default_adapter
            f.headers['Content-Type'] = 'application/json'
            f.headers['AV-Key'] = ENV['av_api_key']
        end
    end
end