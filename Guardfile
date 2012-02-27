guard 'rails', :port => 3000 do
  watch('Gemfile.lock')
  watch(%r{^(config|lib)/.*})
end

guard 'rspec' do
  watch('spec/spec_helper.rb') { "spec" }
  watch('config/routes.rb') { "spec/routing" }
  watch('app/controllers/application_controller.rb') { "spec/controllers" }
  watch(%r{^spec/.+._spec\.rb})
  watch(%r{^app/views/layouts/application.html.haml}) {
    "spec/views"
  }
  watch(%r{^app/views/(.+)/_}) { |m| "spec/views/#{m[1]}" }
  watch(%r{^app/(.+)\.rb}) { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb}) { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb}) { |m|
    [
      "spec/routing/#{m[1]}_routing_spec.rb",
      "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb",
      "spec/acceptance/#{m[1]}_spec.rb"
    ]
  }
end

guard 'bundler' do
  watch('Gemfile')
end
