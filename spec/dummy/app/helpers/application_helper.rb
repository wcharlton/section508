module ApplicationHelper


  def nav
    links = []
    links << { name: 'Home', path: root_path }
    links << { name: 'Formatting', path: formatting_path }
    links << { name: 'Tables', path: tables_path }
    links << { name: 'Images', path: images_path }
    links << { name: 'Media', path: media_path }
    links << { name: 'Lists', path: lists_path }
    # links << { name: '', path: }
    # links << { name: '', path: }
    # links << { name: '', path: }
    links
  end

end
