class CommandStep::CreateModel < CommandStep
  def method_name
    'run'
  end

  def arguments
    ['rails generate model', super].join(' ')
  end
end
