pro gcd
  f = dialog_pickfile(/directory, get_path=p)
  if (p ne "") then begin
    cd, p
    print, p
  endif
end