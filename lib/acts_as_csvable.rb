require 'active_support/core_ext'
require 'active_record'

# A general wrapper for the Exceptions used by ActsAsCSVable. 
# === Module Variables
# <tt>allow_dynamic_import_template_generation</tt> - If no import template is found that matches the header
# rows of the import file, it will "dynamically create" an import template if, and only if, +all+ of the header names
# easily map to writer methods on your model. This might be useful for when you have dynamically generated user selected
# templates. This is set to <em>false</em> by default!
#
module ActsAsCSVable#:nodoc:
  class ActsAsCSVableException < Exception; end#:nodoc:
  class UnknownExportTemplateException < ActsAsCSVableException; end#:nodoc:
  class UnknownImportTemplateException < ActsAsCSVableException; end#:nodoc:
  class MissingGemException < ActsAsCSVableException; end#:nodoc:
  class MissingImportTemplateException < ActsAsCSVableException; end#:nodoc:
    
  mattr_accessor :allow_dynamic_import_template_generation
  
  def self.version
    ActsAsCSVable::Version::STRING
  end
end # ActsAsCSVable

require 'acts_as_csv_exportable'
require 'acts_as_csv_importable'

ActsAsCSVable.allow_dynamic_import_template_generation = false

begin
  require 'csv'
  rescue Exception
    raise ActsAsCSVable::MissingGemException.new("ActsAsCSVable requires the Ruby 1.9 CSV gem")
end
  
require 'array'

ActiveRecord::Base.class_eval do
  include ActsAsCSVExportable::ActiveRecord::Exporting
  include ActsAsCSVImportable::ActiveRecord::Importing
end
