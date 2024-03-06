module HasPermittedParams
  extend ActiveSupport::Concern

  class_methods do
    def has_permitted_params(*params)
      @permitted_params = params
    end

    def permitted_params
      @permitted_params
    end
  end
end
