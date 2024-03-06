module UsingGrape
  class BaseEndpoint < Grape::API
    def self.permitted_with(klass)
      permitted_params = klass.permitted_params
      params_method_name = "#{klass.to_s.underscore}_params"

      helpers do
        define_method params_method_name do
          params.permit(*permitted_params)
        end
      end
    end
  end
end
