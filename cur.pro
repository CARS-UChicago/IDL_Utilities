pro cur
;
;  wrapper around cursor
done = 0
print, 'hit middle button to end'
while (done NE 2) do begin
  cursor, xc, yc, /down
  print, xc, yc
  done = !mouse.button
endwhile

end
