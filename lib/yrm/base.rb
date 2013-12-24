module YRM
  class Base
    class << self
      def find(id)
        record = records.find {|r| r["id"].to_i == id.to_i }

        if record.present?
          new(record)
        else
          # TODO: raise YRM::RecordNotFound.new(id)
          raise "Record for #{name} with id = #{id} not found"
        end
      end

      private
      def storage
        YRM.current.storage[name.downcase]
      end

      def records
        storage["records"]
      end

      def attributes
        storage["attributes"]
      end
    end

    def initialize(attrs = {})
      # 1) Проверить что attrs содержит только допустимые аттрибуты
      # 2) Реализуем класс YRM::RecordNotFound
      # 3) Присвоим attrs к @state
    end

    private
    def attribute_set(name, value)
    end

    def attribute_get(name)
    end
  end
end

