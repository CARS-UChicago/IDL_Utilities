;
; $Id$
;; Changed by MLR to NOT trim blanks from output string
pro pto, l, c, n

; NAME:
; 	PTO
; PURPOSE:
; 	This procedure will output text, to the alphanumeric plane, at the 
;	specified row and column on any ANSI device.

print,string(27B)+'['+strtrim(l,2)+';'+strtrim(c,2)+'H'+n
return
end
