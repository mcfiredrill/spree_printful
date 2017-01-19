Deface::Override.new(:virtual_path => "spree/admin/variants/_form",
 :name => "add_printful_fields_to_variant_form",
 :insert_bottom => "div[data-hook='admin_variant_form_additional_fields']",
 :text => "
 <div class='form-group' data-hook='printful_variant_id'>
   <%= f.label :printful_variant_id, Spree.t(:printful_variant_id) %>

   <%= f.text_field :printful_variant_id, :class => 'form-control' %>
 </div>

 <div class='form-group' data-hook='printfile'>
   <% if @variant.printful_printfile %>
     <%= image_tag @variant.printful_printfile.attachment.url, class: 'img-responsive', style: 'margin: 20px 0; max-width: 50%;' %>
     <%#= link_to 'Remove Printfile' , delete_printfile_path(product_id: @product.slug, id: @variant.id, printfile_id: @variant.printfile.id), class: 'btn btn-danger btn-sm m-b-3', method: :delete %><br>
   <% else %>
     <% @variant.build_printful_printfile %>
   <% end %>

   <%= f.fields_for :printful_printfile do |pf| %>
     <%= pf.label :attachment, Spree.t(:printful_printfile_attachment) %>
     <%= pf.file_field :attachment, { class: 'form-control' } %>
   <% end %>
 </div>
 "
)
