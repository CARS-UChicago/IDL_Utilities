;+
; NAME:
;       SET_X
;
; PURPOSE:
;       This procedure makes the X device the active plotting device.
;       If the active device when the procedure is called is PostScript,
;         then the PS output is printed. 
;       This procedure is meant to be called after the SET_PS procedure.
;
; CATEGORY:
;       Devices.
;
; CALLING SEQUENCE:
;       SET_X
;
; COMMON BLOCKS:
;       PS_COMMON: Contains queue and file used for printing.
;
; SIDE EFFECTS:
;       Closes and prints PostScript output.
;       Changes to vector font and default line thickness.
;
; EXAMPLE:
;       SET_X
;       ...
;       ... [IDL commands to the X device]
;       ...
;       SET_PS, QUEUE='Sutton'
;       ...
;       ... [IDL commands to the PostScript device]
;       ...
;       SET_X 
;       [PostScript output is closed and printed on Queue Sutton]
;
; MODIFICATION HISTORY:
;        Written by:       Harvey Rarback, April 7, 1993
;          No PsPrint      Harvey Rarback, November 21, 1994    
;          Support Unix    Harvey Rarback, March 7, 1997
;-

pro set_x
common ps_common, ps_queue, ps_file

if !d.name eq 'PS' then begin
  device, /close
  if n_elements( ps_file)  eq 0 then ps_file = 'idl.ps'
  if n_elements( ps_queue) eq 0 then get_ps_queue
  if ps_queue ne 'none' then begin
    case !version.os_family of
      'vms':  spawn, /nowait, 'print /queue = ' + ps_queue + ' ' + ps_file
      'unix': spawn, 'lpr -P' + ps_queue + ' ' + ps_file
      else:   msg, 'Printing on platform not yet supported.'
    endcase
  endif
endif

!p.font = -1 & !p.thick = 1. & set_plot, 'X'

end
