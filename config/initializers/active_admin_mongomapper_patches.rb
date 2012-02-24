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
      resource.collection.name
    end

    # Disable filters
    def add_default_sidebar_sections
    end
  end

  class ResourceController < BaseController
    # Use #desc and #asc for sorting.
    def sort_order(chain)
      params[:order] ||= active_admin_config.sort_order
      # table_name = active_admin_config.resource_table_name
      if params[:order] && params[:order] =~ /^([\w\_\.]+)_(desc|asc)$/
        chain.send(:sort, $1.to_sym.send($2))
      else
        chain # just return the chain
      end
    end

    # Disable filters
    def search(chain)
      chain
    end
  end

  module MongoMapper
    COLUMN_TYPES = { Bignum => :integer, Array => :string, Symbol => :string }

    module Patches
      def self.included(base)
        raise 'Include ActiveAdmin::MongoMapper::Patches after MongoMapper::Document' unless base.respond_to?(:collection_name)
        base.extend ClassPatches
      end

      def column_for_attribute(attr)
        field = self.class.keys.values.detect { |c| c.name == attr.to_s }
        OpenStruct.new.tap do |c|
          c.name = field.name
          c.type = ActiveAdmin::MongoMapper::COLUMN_TYPES[field.type] || field.type.to_s.downcase.to_sym
        end if field and field.type
      end

      module ClassPatches
        HIDDEN_COLUMNS = %w(_id _type)

        def content_columns
          keys.map do |name, field|
            next if HIDDEN_COLUMNS.include?(name)
            OpenStruct.new.tap do |c|
              c.name = field.name
              c.type = ActiveAdmin::MongoMapper::COLUMN_TYPES[field.type] || field.type.to_s.downcase.to_sym
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
