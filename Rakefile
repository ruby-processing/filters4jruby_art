# -*- encoding: utf-8 -*-

root = File.expand_path(__dir__)

desc 'run contributed samples'    
task :default => [:demo]

desc 'run all autorun samples'
task :demo do
  Rake::Task[:image_filters].execute
  Rake::Task[:video_filters].execute  
end

desc 'run image samples'
task :image_filters do
  sh "cd #{root}/image_filtering && rake"
end

desc 'run video samples'
task :shaders do
  sh "cd #{root}/video_filtering && rake"
end

