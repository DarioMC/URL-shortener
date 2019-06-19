class UrlsController < ApplicationController

    def show

        begin
    
          url = Url.new
          original_url = url.find_by_short_url("http://localhost:3000/" + params[:short_url]).original_url
          url.update_visits("http://localhost:3000/" + params[:short_url])
          redirect_to original_url
    
        rescue
    
          redirect_to shortened_path(original_url: url.original_url, short_url: "", title: "", visit_count: "", obs: "\"" + @@DOMAIN_NAME + params[:short_url] + "\" -> is not a Short URL  0_0")
          redirect_to controller: 'thing', action: 'edit', id: 3, something: 'else'
    
        end
      end
    
      # Create a Url object and set the parameters to the object
      def create
    
        url = Url.new
        url.original_url = params[:original_url]
    
        if url.sanitize?
    
          if url.find?
    
            url.generate_short_url("http://localhost:3000/")
            url.visit_count = 0
            url.save
    
            job = GetTitleJob.new
            job.get_title(url.short_url)
            redirect_to shortened_path(original_url: url.original_url, short_url: url.short_url, title: url.find_duplicate.title, visit_count: url.visit_count, obs: "New shortened")
    
          else
            redirect_to shortened_path(original_url: url.original_url, short_url: url.find_duplicate.short_url, title: url.find_duplicate.title, visit_count: url.find_duplicate.visit_count, obs: "Before shortened")      
          end
    
        else
          redirect_to error_path(original_url: url.original_url, short_url: "", title: "", visit_count: "", obs: "URL unreachable or has invalid format  (0_0)")
        end
      end
    
      def top
    
        url = Url.new
        @top = url.top
    
      end

    def shortened
        @url = ShortenedUrl.find_by_short_url(params[:short_url])
        host = request.host_with_port
        orignal_url = @url.sanitize_url
        @short_url = host + '/' + @url.short_url
    end

    def fetch_original_url
        fetch_url = ShortenedUrl.find_by_short_url(params[:short_url])
        redirect_to fetch_url.sanitize_url    
    end
      
    private
    
    def find_url
          @url = ShortenedUrl.find_by_short_url(params[:short_url])
    end
      
    def url_params
          params.require(:url).permit(:original_url)
    end


end
