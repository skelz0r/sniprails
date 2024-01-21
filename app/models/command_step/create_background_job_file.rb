class CommandStep::CreateBackgroundJobFile < CommandStep::CreateFile
  def arguments
    [
      "#{background_job_folder}/#{file_name}.rb",
      content
    ]
  end

  def file_name
    properties.fetch('file_name')
  end

  def content
    properties.fetch('content')
  end

  def background_job_folder
    if sidekiq?
      'app/workers'
    else
      'app/jobs'
    end
  end

  def sidekiq?
    true
  end
end
