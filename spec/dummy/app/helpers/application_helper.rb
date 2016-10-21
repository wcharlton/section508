module ApplicationHelper


  def nav
    links = []
    links << { name: 'Home', path: root_path }
    links << { name: 'Formatting', path: formatting_path }
    links << { name: 'Tables', path: tables_path }
    links << { name: 'Images', path: images_path }
    links << { name: 'Media', path: media_path }
    links << { name: 'Lists', path: lists_path }
    links << { name: 'Semantics', path: semantic_path }
    links << { name: 'Frames', path: frames_path }
    links << { name: 'Links', path: links_path }
    # links << { name: '', path: }
    # links << { name: '', path: }
    # links << { name: '', path: }
    links
  end

end
