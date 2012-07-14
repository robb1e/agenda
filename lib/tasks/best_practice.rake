task :best_practices do
  if system("bundle exec rails_best_practices .")
    puts "All good."
  else
    puts "Some bad practices here."
    exit(1)
  end
end