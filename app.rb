# app.rb
# This script loads and executes the illumination.rb file

# First, we'll check if the illumination.rb file exists
if File.exist?('illumination.rb')
  puts "Found illumination.rb. Attempting to load..."
  
  begin
    # Try to load the illumination.rb file
    require_relative 'illumination'
    
    puts "Successfully loaded illumination.rb"
    
    # If Illumination is a class defined in illumination.rb,
    # you might instantiate and use it like this:
    illumination = Illumination.new
    illumination.run_all_patterns(10)
    
    # If illumination.rb contains a main loop or direct execution code,
    # it will run automatically when loaded.
    
    puts "Illumination script execution completed."
  rescue => e
    puts "An error occurred while loading or executing illumination.rb:"
    puts e.message
    puts e.backtrace
  end
else
  puts "Error: illumination.rb not found in the current directory."
  puts "Make sure illumination.rb is in the same directory as app.rb"
end

# You can add any additional application logic here
puts "app.rb execution completed."
