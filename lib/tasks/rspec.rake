task :rspec do
  if system("bundle exec rspec spec")
    puts "Specs passed!"
  else
    puts "Specs failed!!!"
    exit(1)
  end
end