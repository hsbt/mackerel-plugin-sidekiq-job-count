def gem_config(conf)
  #conf.gembox 'default'

  # be sure to include this gem (the cli app)
  conf.gem File.expand_path(File.dirname(__FILE__))
  conf.gem github: 'matsumoto-r/mruby-redis'
end

MRuby::Build.new do |conf|
  toolchain :clang

  conf.enable_bintest
  conf.enable_debug
  conf.enable_test

  gem_config(conf)
end

if RUBY_PLATFORM =~ /linux/
  MRuby::Build.new('x86_64-pc-linux-gnu') do |conf|
    toolchain :gcc

    gem_config(conf)
  end
else
  MRuby::Build.new('x86_64-apple-darwin14') do |conf|
    toolchain :clang

    gem_config(conf)
  end
end
