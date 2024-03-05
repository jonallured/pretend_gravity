module StrongParamsBuilder
  def build_params
    ActionController::Parameters.new(rack_params).tap do |params|
      params.deep_merge!(grape_routing_args) if env.key?(Grape::Env::GRAPE_ROUTING_ARGS)
    end
  end
end

Grape.configure do |config|
  config.param_builder = StrongParamsBuilder
end
