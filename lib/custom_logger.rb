#custom_logger.rb
class CustomLogger < Logger
  def format_message(severity, timestamp, prognam, msg)
    "#{msg}\n"
  end
end

#logfile = File.open(Rails.root + '/log/custom.log', 'a') #create log File
# logfile.sync = true #autoflush data to File
# CUSTOM_LOGGER = CustomLogger.new(logfile)
