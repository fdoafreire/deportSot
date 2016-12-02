 module Report
    class TableScore < ActiveRecord::Base
      self.table_name = 'table_score'

      def self.score
        TableScore.all
      end

      protected

      # The report_state_popularities relation is a SQL view,
      # so there is no need to try to edit its records ever.
      # Doing otherwise, will result in an exception being thrown
      # by the database connection.
      def readonly?
        true
      end
    end # class
 end # module