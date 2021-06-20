def path_to(page_name)
    case page_name

    when /new_user/
        new_user_path
    
    when /users/
        root_path

    else
        raise "Can't find mapping from \"#{page_name}\" to a path."
    end
end