function graphics_context::changed
    common graphics_context_common, current_id, last_id
    if (current_id eq self.id) then return, 0 else return, 1
end

pro graphics_context::get
    self.x = !x
    self.y = !y
    self.z = !z
    self.p = !p
    self.window = !d.window
end


pro graphics_context::set
    common graphics_context_common, current_id, last_id
    current_id = self.id
    !x = self.x
    !y = self.y
    !z = self.z
    !p = self.p
    window, self.window
end

function graphics_context::init
    common graphics_context_common, current_id, last_id

    if n_elements(last_id) eq 0 then begin
        current_id = 0
        last_id = 0
    endif   
    last_id = last_id + 1
    self.id = last_id
    return, 1
end



pro graphics_context__define
graphics_context = { graphics_context, $
    window: !d.window, $
    id:     0L, $
    x:      !x, $
    y:      !y, $
    z:      !z, $
    p:      !p  $
}
end
                     
