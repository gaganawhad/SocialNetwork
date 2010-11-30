unless Rails.env.production?
  # Always enable the debugger for non-production environments
  begin
    require 'ruby-debug'
    Debugger.settings[:autoeval] = true
    Debugger.start
  rescue LoadError
    puts "Debugging disabled. `gem install ruby-debug` to enable."
  end
end