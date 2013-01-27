module Garner
  module Strategies
    module Keys
      # Inject the request GET parameters into the key.
      module RequestGet
        class << self
        
          def field
            :params
          end
          
          def apply(key, context = {})
            key = key ? key.dup : {}
            if context && (request = context[:request]) && [ "GET", "HEAD" ].include?(request.request_method)
              key[field] = context[:request].GET.dup
            end
            key
          end
          
        end
      end
    end
  end
end
