require_relative "config/application"
Rails.application.load_tasks

if %w[development test].include? Rails.env
  task default: %i[standard]
end
