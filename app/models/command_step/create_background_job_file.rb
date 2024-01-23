class CommandStep::CreateBackgroundJobFile < CommandStep::CreateFile
  def arguments
    [
      "#{background_job_folder}/#{file_name}.rb",
      content,
    ]
  end

  def file_name
    properties.fetch('file_name')
  end

  def content
    ERB.new(properties.fetch('content')).result(binding)
  end

  def background_job_folder
    if sidekiq?
      'app/workers'
    else
      'app/jobs'
    end
  end

  def sidekiq?
    config.fetch('background_job', 'active_job') == 'sidekiq'
  end

  def content_class_definition
    if sidekiq?
      "class #{file_name.classify}Worker\n  include Sidekiq::Worker"
    else
      "class #{file_name.classify}Job < ApplicationJob"
    end
  end
end
