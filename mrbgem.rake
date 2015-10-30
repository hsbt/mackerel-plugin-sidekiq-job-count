MRuby::Gem::Specification.new('mackerel-plugin-sidekiq-job-count') do |spec|
  spec.license = 'MIT'
  spec.author  = 'MRuby Developer'
  spec.summary = 'mackerel-plugin-sidekiq-job-count'
  spec.bins    = ['mackerel-plugin-sidekiq-job-count']

  spec.add_dependency 'mruby-print', :core => 'mruby-print'
  spec.add_dependency 'mruby-mtest', :mgem => 'mruby-mtest'
end
