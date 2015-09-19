require 'get_process_mem'

module Logleaks
  class Middleware
    attr_reader :app, :logger

    def initialize(app, logger: nil)
      @app = app
      @logger = logger || find_logger
    end

    def call(env)
      before_rss = get_rss_memory
      response = @app.call(env)
      @logger.info memory_log_entry(before_rss)
      response
    end

    protected

    def find_logger
      if defined?(Rails)
        Rails.logger
      else
        raise ArgumentError, "Must supply a logger option to Logleaks::Middleware"
      end
    end

    def memory_log_entry(before_rss)
      process_pid = Process.pid
      difference_string = memory_difference_string(before_rss, get_rss_memory)
      "Request rss memory for process #{process_pid}: #{difference_string}"
    end

    def memory_difference_string(before, after)
      difference = after - before
      str =  "before: #{before} (#{mb_string(before)})"
      str += ", after: #{after} (#{mb_string(after)})"
      str += ", difference: #{difference} (#{mb_string(difference)})"
      str
    end

    def get_rss_memory
      GetProcessMem.new.bytes
    end

    def mb_string(bytes)
      "#{bytes / (1024 ** 2)} MB"
    end
  end
end
