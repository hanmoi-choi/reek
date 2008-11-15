$:.unshift File.dirname(__FILE__)

require 'reek/smells/smell'

module Reek
  module Smells

    # 
    # A Utility Function is any instance method that has no
    # dependency on the state of the instance.
    #
    class UtilityFunction < Smell

      #
      # Checks whether the given +method+ is a utility function.
      # Any smells found are added to the +report+; returns true in that case,
      # and false otherwise.
      #
      def self.examine(method, report)
        return false if method.name == 'initialize'
        if method.num_statements > 0 and !method.depends_on_self
          report << new(method)
          true
        end
        false
      end

      def detailed_report
        "#{@context} doesn't depend on instance state"
      end
    end

  end
end
