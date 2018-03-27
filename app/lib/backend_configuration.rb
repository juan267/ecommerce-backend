module BackendConfiguration
  ORDER_TABS         ||= [:orders, :payments, :creditcard_payments,
                          :shipments, :credit_cards, :adjustments, :customer_details]
  PRODUCT_TABS       ||= [:products, :custom_attributes, :properties,
                          :variants, :product_properties, :taxonomies,
                          :taxons]
  CONFIGURATION_TABS ||= [:stores, :tax_categories,
                          :tax_rates, :zones,
                          :payment_methods, :shipping_methods,
                          :shipping_categories, :stock_locations,
                          :refund_reasons, :reimbursement_types, :return_authorization_reasons]
  PROMOTION_TABS     ||= [:promotions, :promotion_categories]
  STOCK_TABS         ||= [:stock_items]
  USER_TABS          ||= [:users, :store_credits]

  class MenuItem
    attr_reader :name, :sections, :icon, :label, :url

    def initialize(name, sections, icon, label: nil, url: nil)
      @name = name
      @sections = sections
      @label = label || sections.first
      @url = url
    end

    def self.menu_items
      @menu_items ||= [
        MenuItem.new(
          :orders,
          ORDER_TABS,
          "shopping-cart",
          url: :admin_orders_path
        ),
        MenuItem.new(
          :products,
          PRODUCT_TABS,
          "th-large",
          url: :admin_products_path,
        ),
        MenuItem.new(
          :settings,
          CONFIGURATION_TABS,
          "wrench",
          label: :settings,
          url: :admin_stores_path
        ),
        MenuItem.new(
          :promotions,
          PROMOTION_TABS,
          "bullhorn",
          url: :admin_promotions_path
        ),
        MenuItem.new(
          :stock,
          STOCK_TABS,
          "cubes",
          label: :stock,
          url: :admin_stock_items_path
        ),
        MenuItem.new(
          :users,
          USER_TABS,
          "user",
          url: :admin_users_path
        )
      ]
    end
  end

  class SectionItem
    def initialize(label, url)
      @label = label
      @url = url
    end

    def self.menu_items
      @menu_items ||= [
        SectionItem.new(
          :orders,
          admin_orders_path
        ),
        SectionItem.new(
          :products,
          PRODUCT_TABS,
          "th-large",
          url: :admin_products_path,
        ),
        SectionItem.new(
          :settings,
          CONFIGURATION_TABS,
          "wrench",
          label: :settings,
          url: :admin_stores_path
        ),
        SectionItem.new(
          :promotions,
          PROMOTION_TABS,
          "bullhorn",
          url: :admin_promotions_path
        ),
        SectionItem.new(
          :stock,
          STOCK_TABS,
          "cubes",
          label: :stock,
          url: :admin_stock_items_path
        ),
        SectionItem.new(
          :users,
          USER_TABS,
          "user",
          url: :admin_users_path
        )
      ]
    end
  end
end
