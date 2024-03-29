# config/initializers/active_admin_mongomapper_patches.rb

require "active_admin"
require "active_admin/resource_controller"
require 'ostruct'

module ActiveAdmin
  class Namespace
    # Disable comments
    def comments?
      false
    end
  end

  class Resource
    def resource_table_name
      controller.resources_configuration[:self][:route_instance_name]
    end

    # Disable filters
    def add_default_sidebar_sections
    end
  end

  class ResourceController
    # Use #desc and #asc for sorting.
    def sort_order(chain)
      params[:order] ||= active_admin_config.sort_order
      table_name = active_admin_config.resource_table_name
      if params[:order] && params[:order] =~ /^([\w\_\.]+)_(desc|asc)$/
        chain.send($2, $1)
      else
        chain # just return the chain
      end
    end

    # Disable filters
    def search(chain)
      chain
    end
  end

  module Views
    module Pages
      class Index
        protected
        # https://github.com/gregbell/active_admin/commit/bf341ba505e76ac6ab8d083ffb0b821e6d8ae1f8
        def items_in_collection?
          collection.limit(1).exists?
        end
      end
    end
  end

  module Mongoid
    COLUMN_TYPES = { Bignum => :integer, Array => :string}

    module Patches
      def self.included(base)
        raise 'Include ActiveAdmin::Mongoid::Patches after Mongoid::Document' unless base.respond_to?(:collection_name)
        base.extend ClassPatches
      end

      def column_for_attribute(attr)
        self.class.columns.detect { |c| c.name == attr.to_s}
      end

      module ClassPatches
        HIDDEN_COLUMNS = %w(_id _type)

        def content_columns
          fields.map do |name, field|
            next if HIDDEN_COLUMNS.include?(name)
            OpenStruct.new.tap do |c|
              c.name = field.name
              c.type = ActiveAdmin::Mongoid::COLUMN_TYPES[field.type] || field.type.to_s.downcase.to_sym
            end
          end.compact
        end

        def columns
          content_columns
        end
      end
    end
  end

end
