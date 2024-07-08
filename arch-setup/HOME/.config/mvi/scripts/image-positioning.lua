function rotate_video(amt)
    local rot = mp.get_property_number("video-rotate")
    rot = (rot + amt) % 360
    mp.set_property_number("video-rotate", rot)
end

mp.add_key_binding(nil, "rotate-video", rotate_video)
