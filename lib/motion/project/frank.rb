unless defined?(Motion::Project::Config)
  raise "This file must be required within a RubyMotion project Rakefile."
end

require 'cucumber/rake/task'

frank_skeleton = File.join(Gem.loaded_specs['frank-cucumber'].full_gem_path, 'frank-skeleton')

Motion::Project::App.setup do |app|
  app.development do
    app.vendor_project(frank_skeleton, :static,
                      :products => Dir.entries(frank_skeleton).select { |fnames| /.a$/ =~ fnames && !(/Mac.a$/ =~ fnames) })
    app.frameworks << 'CFNetwork'
  end
end

namespace 'frank' do

  desc 'Build app for simulator, launch simulator and run features'
  task :run do
    Rake::Task["build:simulator"].invoke
    Cucumber::Rake::Task.new(:features, "") do |t|
      app_bundle_path = File.expand_path(App.config.app_bundle('iPhoneSimulator'), Rake.application.original_dir)
      t.cucumber_opts = "APP_BUNDLE_PATH='#{app_bundle_path}' --format pretty #{(ENV["FEATURES"] || "features")} "
    end.runner.run
  end

  desc "Run app with symbiote enabled"
  task :symbiote do
    Motion::Project::App.setup do |app|
      app.resources_dirs << frank_skeleton
    end
    Rake::Task["simulator"].invoke
  end

  desc "Create first feature files"
  task :init_features do
    target_dir = File.join(Rake.application.original_dir, 'features')
    unless File.exists?(target_dir)
      FileUtils.cp_r(File.join(frank_skeleton, 'features'), target_dir)
      puts "created new features in ./features"
    else
      puts "features/ already exists, skipping."
    end
  end

end

desc "Shorthand for frank:run"
task 'frank' => 'frank:run'

