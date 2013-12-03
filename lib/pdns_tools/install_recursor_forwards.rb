module PdnsTools
  class InstallRecursorForwards
    def initialize
      config
      return @url, @user, @password, @file
    end

    def config
      conf = YAML.load_file('/etc/pdns_tools.yml')
      conf['installrecursorforwards'].each do |k,v|
        case k
          when 'url'
            @url = v
          when 'user'
            @user = v
          when 'password'
            @password = v
          when 'file'
            @file = v
        end
      end
    end

    def request_url url, user, password
      JSON.parse(open(url, :http_basic_authentication=>[user, password]).read)
    end

    def parse_records
      ap @url
      request_url(@url, @user, @password).map { |f| "#{f['zone']}=#{f['nameservers']}" }
    end

    def update
      begin
        File.open(@file, 'w') { |fh| fh.write parse_records.join("\n") }
        ssp2_records.map { |f| file.write("#{f}") }
      rescue Exception => e
        return e.message
      end
    end
  end
end