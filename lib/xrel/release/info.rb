module Xrel
  module Release
    class Info
      def self.find(keyword)
        params = if keyword.size == 12
                   { id: keyword }
                 else
                   { dirname: keyword }
                 end
        release = Xrel::Client.new.get('/release/info', params: params)
      end
    end
  end
end