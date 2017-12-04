class DoogleController < ApplicationController
  def home
  end
  
  def search
    @word = Word.find_by(word: params[:word])
    
    if(!@word)
      @fetched_definitions = fetch_from_dictionary_api(params[:word])
      
      # return nothing if there are no available definitions
      return nil unless @fetched_definitions.present? 
      
      @word = Word.create!(word: params[:word])
      @fetched_definitions.each do |definition|
        #<dt>:
        remove_1 = definition.to_s.gsub(/<dt>:*\s*:*/, "")
        #<sx></sx>
        remove_2 = remove_1.gsub(/:?<sx>.*<\/sx>\s*/,"")
        #<vi></vi>
        remove_3 = remove_2.gsub(/<vi>.*<\/vi>\s*/,"")
        #<dx><dxt></dxt></dx>
        remove_4 = remove_3.gsub(/<dx>.*<\/dx>\s*/,"")
        #<ca><cat></cat><ca>
        remove_5 = remove_4.gsub(/<ca>.*<\/ca>\s*/,"")
        #</dt>
        clean_definition = remove_5.gsub(/<\/dt>/, "")
        
        if(clean_definition != '')
          clean_definition = clean_definition.gsub(/(<fw>|<un>|<d_link>|<it>)/,"").gsub(/(<\/fw>|<\/un>|<\/d_link>|<\/it>)\s*/,"")
          @word.definitions.create(content: clean_definition)
        end
      end
    end
    
    respond_to do |format|
      format.html
      format.json { render json: @word.definitions }
    end
  end
  
  private
    def fetch_from_dictionary_api(word)
      conn = Faraday.new(:url => "http://www.dictionaryapi.com/api/v1/references/collegiate/xml/")
      
      search_word = word.gsub(/\s/, "%")
      
      begin
        response = conn.get search_word + "?key=" + ENV["API_KEY"]
        doc  = Nokogiri::XML(response.body)
        doc.xpath('//dt')
      rescue URI::InvalidURIError
        return ""
      end
    end
end
