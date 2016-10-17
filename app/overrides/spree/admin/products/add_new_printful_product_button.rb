Deface::Override.new(
  virtual_path: 'spree/admin/products/index',
  name: 'add_new_printful_product_button',
  insert_after: 'erb[silent]:contains("content_for :page_actions do")',
  text: '<%= button_link_to Spree.t(:new_printful_product), new_admin_printful_product_path, { class: "btn-default", icon: "add", id: "admin_new_printful_product" } %>'
)
