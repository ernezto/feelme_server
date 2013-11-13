namespace :test do

  desc "run Rspec unit tests and cucumber tests"
  task :all do
    system "rake spec"
    system "rake cucumber"
  end
end
