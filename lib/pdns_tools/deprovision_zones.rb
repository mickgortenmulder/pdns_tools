module PdnsTools
  class DeprovisionZones
    def initialize
      @host = read_config[0]
      @user = read_config[1]
      @db = read_config[2]
      @password = read_config[3]
    end

    def read_config
      file = File.new("/etc/powerdns/pdns.d/pdns.local", "r")

      file.each do |line|
        case line
          when /^gmysql-host=([\S]+)$/
            @host = $1
          when /^gmysql-user=([\S]+)$/
            @user = $1
          when /^gmysql-dbname=([\S]+)$/
            @db = $1
          when /^gmysql-password=([\S]+)$/
            @password = $1
        end
      end
      return @host, @user, @db, @password
    end

    def deprovision_records_and_domains
      deprovision_ids.map{ |r| execute(destroy_domains_query(r)) }
      deprovision_ids.map{ |r| execute(destroy_records_from_domain_query(r)) }
      nil
    end

    private

    def deprovision_ids
      array = []
      execute(select_records_query).map{ |r| array << r['domain_id']}
      array.uniq
    end

    def connection
      Mysql2::Client.new(:host => @host, :username => @user, :password => @password, :database => @db)
    end

    def execute query
      connection.query(query)
    end

    def destroy_domains_query id
      "DELETE FROM domains WHERE id = #{id};"
    end

    def destroy_records_from_domain_query id
      "DELETE FROM records WHERE domain_id = #{id};"
    end

    def select_records_query
      "SELECT * FROM records WHERE content LIKE '%deprovision-me%' AND type = 'TXT';"
    end
  end
end