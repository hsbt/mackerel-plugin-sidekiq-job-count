MRuby::Gem::Specification.new('sidekiq-job-count') do |spec|
  spec.license = 'MIT'
  spec.author  = 'MRuby Developer'
  spec.summary = 'sidekiq-job-count'
  spec.bins    = ['sidekiq-job-count']

  spec.add_dependency 'mruby-print', :core => 'mruby-print'
  spec.add_dependency 'mruby-mtest', :mgem => 'mruby-mtest'
end
