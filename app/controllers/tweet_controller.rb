require 'twitter'
class TweetController < ApplicationController
    def index
        @array
        search = params[:search]
        puts "@@@@@@@@@@@@@@@@"
        puts search
        config = {
            consumer_key:    "El5Kg9c8SR4CDvBNdlNkE9G1Q",
            consumer_secret: "xJaJxUTvkAXmXfx9ZpHrfQq8r2HmqqivbzTyRXNj9aVUyW0L4R",
        }
        if search 
            client = Twitter::REST::Client.new(config)
            tweets = client.search(search.to_s, result_type: "recent").take(10)
            @array = tweets.map{ |t| t.to_json if t.to_json["coordinates"] != "null"}.compact
            # @array.each do |tweet|
            #     puts tweet.text
            # end
            @size = @array.length
        else

        end
        respond_to do |format|
            format.html
            format.json{
              render json: @array
            }
        end
    end

    def search
        
    end
end
