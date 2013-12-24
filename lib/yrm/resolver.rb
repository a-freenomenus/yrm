module YRM
  class Resolver
    class << self
      def inject!
        ::Object.extend ResolverExtension
      end

      def provides?(name)
        ::YRM.current.classes.include? name
      end

      def provide!(name)
        new_class = Class.new("::YRM::Base")
        # Будем генерировать методы для аттрибутов:
        # '#{attr_name}' -> attribute_get(method_name)
        # '#{attr_name}=' -> attriubte_set(method_name, value)
      end
    end

  end

  module ResolverExtension
    def const_missing(name)
      if ::YRM::Resolver.provides? name
        ::YRM::Resolver.provide! name
      else
        super
      end
    end
  end
end

::YRM::Resolver.inject!
