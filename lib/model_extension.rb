module ModelExtension

  DEMO_IMAGE_APP_REGEXP = /^app/i

  def get_demo_image_list(img_col, &filter)
    image_list = []
    self.send(img_col).to_s.split(ApplicationHelper::SPECIAL_SYMBO_REG).each do |img|
      next unless img =~ /\.(jpg|png|gif|jpeg)$/i
      # filter not exists or filter returns true, add img to the list
      image_list << [ENV["ASSETS_HOST"], self.base_url, img].join('/') if filter.nil? || filter.call(img)
    end
    return image_list
  end

  def get_demo_image_list_for_web(img_col)
    get_demo_image_list(img_col) do |img|
      File.basename(img) !~ DEMO_IMAGE_APP_REGEXP
    end
  end

  def get_demo_image_list_for_app(img_col)
    get_demo_image_list(img_col) do |img|
      File.basename(img) =~ DEMO_IMAGE_APP_REGEXP
    end
  end

end