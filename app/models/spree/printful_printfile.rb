module Spree
  class PrintfulPrintfile < Asset
    validate :no_attachment_errors

    has_attached_file :attachment, styles: { medium: "300x300>", thumb: "100x100>" }
    validates_attachment :attachment, presence: true, content_type: { content_type: %w(image/jpeg image/jpg image/png) }

    # if there are errors from the plugin, then add a more meaningful message
    def no_attachment_errors
      unless attachment.errors.empty?
        # uncomment this to get rid of the less-than-useful interim messages
        errors.clear
        errors.add :attachment, "Paperclip returned errors for file '#{attachment_file_name}' - check ImageMagick installation or image source file."
        false
      end
    end
  end
end
